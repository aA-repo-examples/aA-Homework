class UserMailer < ApplicationMailer
  default from: 'catwhisperer@99cats.com'

  def welcome_email(user)
    @user = user
    @url = 'http://example.com/session/new'
    mail(to: @user.username, subject: 'Welcome to 99Cats!')
  end
end
