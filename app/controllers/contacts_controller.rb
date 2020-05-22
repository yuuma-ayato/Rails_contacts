class ContactsController < ApplicationController
  def index
  end
  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      Contact.create(params[:blog])
      redirect_to new_contact_path, notice: "お問い合わせ内容を送信しました。"
    else
      render :new
    end
  end
  private
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
