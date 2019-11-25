class UserMailer < ApplicationMailer
  default from: 'sumanthrao005@gmail.com'
  def welcome_email
  @user = params[:user]
  puts "i am coming "
  @url  = 'google.com'
  mail(to: @user.email, subject: 'Welcome to My Awesome Site')
end
end
