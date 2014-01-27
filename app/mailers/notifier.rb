class Notifier < ActionMailer::Base
  default from: "the_captain@marsattracts.com"

  def pass_confirm(passenger)
    @greeting = "Ahoy"
    @passenger = passenger

    mail(:to => @passenger.email,
           :name => @passenger.first_name,
           :subject => "Your ticket to Mars!" 
           )
  end

end
