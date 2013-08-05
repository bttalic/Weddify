class UserMailer < ActionMailer::Base
	default from: "b.ttalic@gmail.com"

	def welcome_email(user)
		@user = user
		@url  = 'http://localhost:3000/signin'
		@to="#{@user.email_groom}, #{ @user.email_bride}"
		mail(to: @to, subject: "Dobro dosli na Weddify") 


	end
end

