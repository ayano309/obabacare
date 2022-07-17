class Dashboard::ContactsController < ApplicationController
  before_action :authenticate_admin!
  layout 'dashboard/dashboard'
  def index
    @contacts = Contact.all.order(created_at: 'desc')
  end

  def show
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact = Contact.find(params[:id])
    if @contact.update!(contact_params)
      redirect_to dashboard_contacts_path, notice: 'ステータスを更新しました'
    else
      flash.now[:error] = 'ステータスを更新できませんでした'
      render :show
    end
  end

  def contact_params
    params.require(:contact).permit(:status)
  end
end
