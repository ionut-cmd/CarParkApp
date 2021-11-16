class ApplicationMailer < ActionMailer::Base
  default to: "ib00400@surrey.ac.uk", from: 'info@mynotes.com'
  layout 'mailer'
end
