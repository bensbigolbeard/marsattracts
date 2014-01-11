class PassengersController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def passenger_params 
      params.require(:passenger).permit(:first_name, :last_name, :email, :phone, :address, :emergency_contact, :date_of_birth)
    end
end
