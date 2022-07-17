class DashboardController < ApplicationController
  before_action :authenticate_admin!
  layout 'dashboard/dashboard'

  def index
    @contacts = Contact.new_contacts(params[:page])
  end
end
