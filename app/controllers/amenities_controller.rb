class AmenitiesController < ApplicationController
  respond_to :json
  # Extract the contents of the Amenities table, store it as JSON
  # to allow access of data by Angular.js
  def index
    @amenities = Amenity.all
    
    respond_with(@amenities) do |format|
      format.json {render json: @amenities.as_json }
    end
  end

end
