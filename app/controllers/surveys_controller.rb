class SurveysController < ApplicationController

  before_action :find_survey
  before_action :find_questions, only: [:submit]
  before_action :find_user_answers, only: [:take]

  def show
    @include_charts = true
    calculate_results
  end

  def take
  end

  def submit
    update_user
    save_answers
    redirect_to "/surveys/#{@survey.slug}/"
  end

  private

  def find_survey
    @survey ||= Survey
      .includes(:questions)
      .find_by(slug: params[:id]) || Survey.find(id: params[:id])
  end

  def find_questions
    @questions ||= Question.where(
      survey: @survey
    )
  end

  def find_user_answers
    @answers ||= Answer
      .includes(:question)
      .where(survey: @survey, user: current_user)
      .group_by { |answer| answer.question.slug }
  end

  def update_user
    current_user.update_attributes(user_params)
  end

  def save_answers
    answer_params.map do |key, value|
      question = @questions.find_by(slug: key)
      raise Exception, "Could not find question #{key}" unless question.present?
      answer = Answer.find_or_create_by(
        question: question,
        survey: @survey,
        user: current_user
      )
      answer.update_attributes(answer: value)
    end
  end

  def calculate_results
    @results_by_question = Answer
      .joins(:question)
      .where(survey: @survey)
      .group(:"questions.slug")
      .count

    @results_by_answer = Answer
      .joins(:question)
      .where(survey: @survey)
      .where("questions.response_type" => :multiple_choice)
      .group("questions.slug", :answer)
      .count
      .reduce({}) do |acc, (key, value)|
        # Query returns compound key, e.g. {[1,2,3]: 5}
        # JS doesn't support compound object keys, so convert to single value
        # string, e.g. `{"1:2:3": 5}`
        acc["#{key[0]}:#{key[1]}"] = value
        acc
      end

    @results_by_group = Answer
      .joins(:question, :user)
      .where(survey: @survey)
      .where("questions.response_type" => :multiple_choice)
      .group("questions.slug", :answer, "users.group")
      .count
      .reduce({}) do |acc, (key, value)|
        # Query returns compound key, e.g. {[1,2,3]: 5}
        # JS doesn't support compound object keys, so convert to single value
        # string, e.g. `{"1:2:3": 5}`
        acc["#{key[0]}:#{key[1]}:#{key[2]}"] = value
        acc
      end
  end

  def user_params
    params.require(:user).permit(
      :group,
      :street_address
    ).reject do |_key, value|
      value.blank?
    end
  end

  def answer_params
    params.require(:answers).permit(
      :pro_tourism,
      :pro_property_values,
      :pro_personal_use,
      :pro_transportation,
      :pro_cleanup_land,
      :pro_other,
      :pro_top,
      :con_property_value,
      :con_loss_of_land,
      :con_privacy,
      :con_safety,
      :con_building_costs,
      :con_maintenance_costs,
      :con_other,
      :con_top,
      :support,
      :selectmen_vote,
      :town_action,
      :survey_feedback
    ).reject do |_key, value|
      value.blank?
    end
  end
end
