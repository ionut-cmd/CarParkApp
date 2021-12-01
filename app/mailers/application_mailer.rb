class ApplicationMailer < ActionMailer::Base
  default to: "ib00400@surrey.ac.uk", from: 'info@mycarapp.com'
  layout 'mailer'
end
