class Api::ContactsController < ApplicationController
  # def one_contact_action
  #   @contact = Contact.first
  #   render 'one_contact_view.json.jbuilder'
  # end

  # def all_contacts_action
  #   @contacts = Contact.all
  #   render 'all_contacts_view.json.jbuilder'
  # end

  def index
    @contacts = Contact.all
    render 'index.json.jbuilder'
  end

  def create
    @contact = Contact.new(
                           first_name: params[:first_name],
                           last_name: params[:last_name],
                           email: params[:email],
                           phone_number: params[:phone_number]
                          )

    @contact.save
    render 'show.json.jbuilder'

  end

  def show
    @contact = Contact.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @contact = Contact.find(params[:id])

    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.last_name = params[:last_name]  || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @phone_number

    contact.save
    render 'show.json.jbuilder'

  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    render json: {message: "You have deleted the contact successfully"}

  end


end
