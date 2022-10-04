module Usecases
  class ReturnPastLaunches 
    attr_reader :http_client

    def initialize(http_client)
      @http_client = http_client
    end

    def call(params={}, headers={})
      @http_client.get('past', params, headers)
    end
  end
end