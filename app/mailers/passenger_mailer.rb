class PassengerMailer < ActionMailer::Base
  default from: "Mars Attracts! <mars.attracts.app@gmail.com>"

#  def trip_confirmation(passenger)

def passenger_mailer
    @greeting = "Hi"

    mail( to: "Chris <cboette@gmail.com>",
          subject: "You're going to Mars!")
  end
end
