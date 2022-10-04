# frozen_string_literal: true

module Usecases
  class ReturnLatestLaunch
    attr_reader :http_client
    
    def initialize(http_client)
      @http_client = http_client
    end
    
    def call(params={}, headers={})
      @http_client.get('latest', params, headers)
    end
  end
end

