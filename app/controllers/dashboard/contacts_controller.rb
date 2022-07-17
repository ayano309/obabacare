class Dashboard::ContactsController < ApplicationController
  before_action :authenticate_admin!
  layout 'dashboard/dashboard'
  
  def index
  end

  def show
  end
end
