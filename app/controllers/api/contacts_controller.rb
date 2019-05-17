class Api::ContactsController < ApplicationController
  def index
    if current_user
      @contacts = current_user.contacts

      name_search = params[:name]
      if name_search
        @contacts = @contacts.where(
                                    "first_name iLIKE ? OR last_name iLIKE ? OR middle_Name iLIKE ? OR bio iLIKE ? OR email iLIKE ?", 
                                    "%#{name_search}%", 
                                    "%#{name_search}%", 
                                    "%#{name_search}%", 
                                    "%#{name_search}%", 
                                    "%#{name_search}%"
                                    )
        end

      render 'index.json.jbuilder'

    else
        render json: []
    end
  end

    def create
      @contact = Contact.new(
                             first_name: params[:first_name],
                             middle_Name: params[:middle_Name],
                             last_name: params[:last_name],
                             bio: params[:bio],
                             email: params[:email],
                             phone_number: params[:phone_number],
                             user_id: current_user.id
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
      @contact.middle_Name = params[:middle_Name] || @contact.middle_Name
      @contact.last_name = params[:last_name] || @contact.last_name
      @contact.bio = params[:bio] || @contact.bio
      @contact.email = params[:email] || @contact.email
      @contact.phone_number = params[:phone_number] || @contact.phone_number

      @contact.save
      render 'show.json.jbuilder'
    end

    def destroy
      @contact = Contact.find(params[:id])
      @contact.destroy
      render json: {message: "Contact successfully destroyed!!"}
    end
end
