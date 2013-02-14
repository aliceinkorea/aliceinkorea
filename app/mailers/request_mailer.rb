class RequestMailer < ActionMailer::Base
  default from: "Alice <aliceinkoreateam@gmail.com>"
  
  def confirm_request(request)
    @request = request
    mail(:to => @request.email, :subject => "Alice has received your ticket purchase request")
  end
  
end
