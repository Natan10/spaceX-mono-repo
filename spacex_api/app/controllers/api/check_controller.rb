module Api
  class CheckController < ApplicationController
    def health_check
      render json: {
        status: 'api up!!!'
      }
    end
  end
end
