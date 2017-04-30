class SurveysController < ApplicationController

  before_action :find_survey, only: [:show, :new]

  def show
  end

  def new
  end

  private

  def find_survey
    @survey ||= Survey
      .includes(:questions)
      .find_by(slug: params[:id]) || Survey.find(id: params[:id])
  end

end
