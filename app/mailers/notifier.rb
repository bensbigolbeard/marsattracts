class Notifier < ActionMailer::Base
  default from: "cboette@gmail.com"

  def pass_confirm
      @greeting = "Hi"
      # @passenger = passenger

      mail(:to => "cboette@gmail.com",
             :name => "Chris",
             :subject => "You're going to Mars!" 
             )
  end

end
