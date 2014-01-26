class Notifier < ActionMailer::Base
  default from: "the_captain@marsattracts.com"

  def pass_confirm
      @greeting = "Hi"
      # @passenger = passenger

      mail(:to => "mars.attracts.app@gmail.com",
             :name => "Passenger",
             :subject => "You're going to Mars!" 
             )
  end

end
