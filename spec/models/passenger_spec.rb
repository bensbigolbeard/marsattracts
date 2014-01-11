require 'spec_helper'

describe Passenger do
  it "is valid with a first name, last name, email, and date of birth" do
    passenger = Passenger.new(
      first_name: 'Alice',
      last_name: 'Murder-Face',
      email: 'amf@example.com',
      date_of_birth: Time.now)
    expect(passenger).to be_valid
  end
  it "is invalid without a first name" do
    expect(Passenger.new(first_name: nil)).to have(1).errors_on(:first_name)
  end
  it "is invalid without a last name" do 
    expect(Passenger.new(last_name: nil)).to have(1).errors_on(:last_name)
  end
  it "is invalid without an email" do 
    expect(Passenger.new(email: nil)).to have(1).errors_on(:email)
  end
  it "is invalid with a duplicate email address" do
    Passenger.create(
      first_name: 'Joe', last_name: 'Test',
        email: 'test@example.com', date_of_birth: Time.now)
    passenger = Passenger.new(
      first_name: 'Jane', last_name: 'Test',
        email: 'test@example.com', date_of_birth: Time.now) 
    expect(passenger).to have(1).errors_on(:email)
  end
  it "is invalid without a date of birth" do 
    expect(Passenger.new(date_of_birth: nil)).to have(1).errors_on(:date_of_birth)
  end
  it "redirects to a confirmation page" 

  
end