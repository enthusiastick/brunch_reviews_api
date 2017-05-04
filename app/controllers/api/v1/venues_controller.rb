class Api::V1::VenuesController < Api::ApiController
  def show
    venue = Venue.find(params[:id])
    render json: venue
  end
end
