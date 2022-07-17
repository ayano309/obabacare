class Dashboard::ContactsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_contact, only: %w[show update destroy]
  layout 'dashboard/dashboard'
  def index
    @contacts = Contact.on_contacts(params[:page])
  end

  def show; end
  
  def update
    if @contact.update!(contact_params)
      redirect_to dashboard_contacts_path, notice: 'ステータスを更新しました'
    else
      flash.now[:error] = 'ステータスを更新できませんでした'
      render :show
    end
  end
  
  def destroy
    @contact.destroy!
    redirect_to dashboard_contacts_path, notice: 'お問い合わせを削除しました'
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end
  
  def contact_params
    params.require(:contact).permit(:status)
  end
end
