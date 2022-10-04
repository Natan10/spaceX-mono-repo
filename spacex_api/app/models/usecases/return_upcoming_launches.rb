module Usecases
  class ReturnUpcomingLaunches
    attr_reader :http_client

    def initialize(http_client)
      @http_client = http_client
    end

    def call(params={}, headers={})
      @http_client.get('upcoming', params, headers)
    end
  end
end