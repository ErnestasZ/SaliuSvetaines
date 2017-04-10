class UserMailer < ApplicationMailer

  def contact_admin(params)
    @name = params[:name]
    @email = params[:email]
    @text = params[:text]
    subject = params[:subject]
    mail(to: ENV["ADMIN_EMAIL"], subject: "Žaidėjas #{@name} rašo #{subject}" ) do |format|
      format.html(content_transfer_encoding: "7bit")
    end

  end

   def contact_user(params)
    @name = params[:name]
    @email = params[:email]
    @text = params[:text]
    subject = params[:subject]
    mail(to: @email, subject: "Jūs siuntėte laišką" ) do |format|
      format.html(content_transfer_encoding: "7bit")
    end
    
  end

end
