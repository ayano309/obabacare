class VitalMonthsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:keyword].present?
      @keyword = params[:keyword].strip
      @vital_months = Vital.search_month_information(@keyword)
    else
      @keyword = ''
      @vital_months = Vital.vitals_month(current_user)
    end
  end
end
