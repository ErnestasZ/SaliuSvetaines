class ContactController < ApplicationController

  def index

  end

  def new_mail
    if verify_recaptcha
      UserMailer.contact_user(params).deliver_now
      UserMailer.contact_admin(params).deliver_now
      redirect_to contact_us_path
      flash[:notice] = "Jūsų laiškas išsiųstas"
    else
      redirect_to contact_us_path
      flash[:notice] = "Patvirtinkite, kad ne robotas"
    end

  end

  private
  def new_mail_params
    params.permit(:name, :email, :subject, :text)
  end


end
