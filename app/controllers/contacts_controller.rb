class ContactsController < ApplicationController
  
  # GET request to /contacts
  def new
    @contact = Contact.new
  end
  
  def create
    # Mass assignmentof form fields into Contact objects
    @contact = Contact.new(contact_params)
    # Save the contact to the DB
    if @contact.save
      # Store form fields via parameters, into variables
      name = params[:contact][:name]
      email = params[:contact][:email]
      comments = params[:contact][:comments]
      # Plug variables into Contact Mailer
      # Email method and send email
      ContactMailer.contact_email(name, email, comments).deliver
      # Store success messagein flash hash
      # and redirectto the new action
      flash[:success] = "Message sent."
      redirect_to new_contact_path 
    else
      # If Contact object doesn't save
      # store error in flash hash
      # and redirect to the new action
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end

  private
    # To collect data from form, we need to use strong parameters
    # and whitelist form fields
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end

end
