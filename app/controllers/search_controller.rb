class SearchController < ApplicationController
  def index
    state = params[:state]

    conn = Faraday.new(url: 'https://api.propublica.org') do |faraday|
      faraday.headers['X-API-Key'] = 'EjAuEudPdawH41TVRZSqYDCDSR1jpnHKhAYy0h5A'
    end

    response = conn.get("/congress/v1/members/house/#{state}/current.json")

    json = JSON.parse(response.body, symbolize_names: true)
    @members = json[:results]
  end
end
