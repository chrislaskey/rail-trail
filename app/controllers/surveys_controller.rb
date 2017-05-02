class SurveysController < ApplicationController

  before_action :find_survey

  def show
  end

  def take
  end

  def create
  end

  def update
  end

  private

  def find_survey
    @survey ||= Survey
      .includes(:questions)
      .find_by(slug: params[:id]) || Survey.find(id: params[:id])
  end

end
