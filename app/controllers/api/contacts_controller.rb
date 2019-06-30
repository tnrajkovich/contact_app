class Api::ContactsController < ApplicationController
  def index
    @contact = Contact.all
    render "all_contacts.json.jb"
  end

  def show
    @contact = Contact.find_by(id: params["id"])
    render "show.json.jb"
  end

  def create
    @contact = Contact.new(
      first_name: params["first_name"],
      last_name: params["last_name"],
      middle_name: params["middle_name"],
      biography: params["biography"],
      email: params["email"],
      phone_number: params["phone_number"],
    )
    @contact.save
    render "all_contacts.json.jb"
  end

  def update
    @contact = Contact.find_by(id: params["id"])
    @contact.first_name = params["first_name"] || @contact.first_name
    @contact.last_name = params["last_name"] || @contact.last_name
    @contact.middle_name = params["middle_name"] || @contact.middle_name
    @contact.biography = params["biography"] || @contact.biography
    @contact.email = params["email"] || @contact.email
    @contact.phone_number = params["phone_number"] || @contact.phone_number
    @contact.save
    render "show.json.jb"
  end

  def delete
    @contact = Contact.find_by(id: params["id"])
    @contact.destroy
    render json: "The contact has been destroyed."
  end
end
