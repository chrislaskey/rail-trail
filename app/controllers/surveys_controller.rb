class SurveysController < ApplicationController

  before_action :find_survey
  before_action :find_questions, only: [:create]
  before_action :find_answers, only: [:create]

  def show
  end

  def take
  end

  # TODO: rename submit?
  def create
    # Update user fields
    current_user.update_attributes(user_params)
    # Update answer fields
    answer_params.map do |key, value|
      question = @questions.find_by(slug: key)
      raise Exception, "Could not find question #{key}" unless question.present?
      answer = @answers.find_or_create_by(
        question: question,
        survey: @survey,
        user: current_user
      )
      answer.update_attributes(answer: value)
    end

    redirect_to "/surveys/#{@survey.slug}/"
  end

  def update
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

  def find_answers
    @answers ||= Answer.where(
      survey: @survey,
      user: current_user
    )
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
      :selectment_vote,
      :town_action
    ).reject do |_key, value|
      value.blank?
    end
  end
end
