class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user

    mail to: user.username, subject: "Sign Up Confirmation"
  end

  def password_reset(user)
    @user = user
    @url = "http://localhost:3000/reset/#{user.reset_token}"
    mail to: user.username, subject: "Password Reset"
  end
end
