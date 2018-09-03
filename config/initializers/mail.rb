ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'smondal',
  :password       => 'sandip123',
  :domain         => 'heroku.com'
}