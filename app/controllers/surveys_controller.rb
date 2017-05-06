class SurveysController < ApplicationController

  before_action :find_survey

  def show
  end

  def take
  end

  def create
    # Update user fields
    # current_user.update_attributes(user_params)
    # Update answer fields
  end

  def update
  end

  private

  def find_survey
    @survey ||= Survey
      .includes(:questions)
      .find_by(slug: params[:id]) || Survey.find(id: params[:id])
  end

  def user_params
    params.require(:user).permit(
      :group,
      :address
    )
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
      :trail
    )
  end
end
