class Dashboard::ContactsController < ApplicationController
  before_action :authenticate_admin!
  layout 'dashboard/dashboard'
  def index
    @contacts = Contact.all.order(created_at: 'desc')
  end

  def show
    @contact = Contact.find(params[:id])
  end
end
