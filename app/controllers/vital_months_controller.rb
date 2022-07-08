class VitalMonthsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @vital_months = Vital.vitals_month(current_user)
  end
end
