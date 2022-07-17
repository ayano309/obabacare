class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path, notice: 'お問い合わせを送信しました。'
    else
      flash.now[:error] = 'お問い合わせの送信に失敗しました。'
      render :index
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
