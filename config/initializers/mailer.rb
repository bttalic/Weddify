ActionMailer::Base.smtp_settings = {
   :address => "smtp.gmail.com",
   :port => 587,
   :domain => 'gmail.com',
   :authentication => :plain,
   :user_name=>"b.ttalic@gmail.com",
   :password=>'talic22029020',
   :enable_starttls_auto => true
}