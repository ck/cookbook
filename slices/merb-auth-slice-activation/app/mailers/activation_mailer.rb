class MerbAuthSliceActivation::ActivationMailer < Merb::MailController
  include Merb::MerbAuthSliceActivation::MailerHelper
  
  controller_for_slice MerbAuthSliceActivation, :templates_for => :mailer, :path => "views"

  def signup
    @user = params[:user]
    Merb.logger.info "Sending Signup to #{@user.email} with code #{@user.activation_code}"
    render_mail :layout => nil
  end

  def activation
    @user = params[:user]
    Merb.logger.info "Sending Activation email to #{@user.email}"
    render_mail :layout => nil
  end

end
