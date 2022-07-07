class VitalWeeksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @vitals = Vital.vitals_month(current_user)
  end
end
