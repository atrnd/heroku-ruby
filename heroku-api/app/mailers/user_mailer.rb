class UserMailer < ApplicationMailer
  default from: 'hoangh33333@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email,
         subject: 'Welcome to Spam')
  end
end
