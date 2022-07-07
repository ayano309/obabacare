class VitalWeeksController < ApplicationController
  before_action :authenticate_user!
  
  def index
     @vitals = Vital.where(user_id: current_user.id)
  end
end
