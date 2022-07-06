class DefecationsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    vital = Vital.find(params[:vital_id])
    vital.defecations.create!(user_id: current_user.id)
    redirect_to vital_path(vital)
  end
  
  def destroy
    vital = Vital.find(params[:vital_id])
    defecation = vital.defecations.find_by!(user_id: current_user.id)

    defecation.destroy!
    redirect_to vital_path(vital)
  end
end