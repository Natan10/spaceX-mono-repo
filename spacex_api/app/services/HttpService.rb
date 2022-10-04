require 'faraday'

class HttpService
  attr_reader :conn

  def initialize
    @conn = Faraday.new(
      url: 'https://api.spacexdata.com/v4/launches',
      headers: {'Content-Type' => 'application/json'}
    )
  end

  def get(url, params = {}, headers ={})
    @conn.get(url, params, headers).body
  end
end