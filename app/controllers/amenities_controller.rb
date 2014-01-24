class AmenitiesController < ApplicationController
  respond_to :json

  def index
    @amenities = Amenity.all
    
    respond_with(@amenities) do |format|
      format.json {render json: @amenities.as_json }
    end
  end

end
