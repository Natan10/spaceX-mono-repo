module Api
  class LaunchController < ApplicationController

    def all_launches
      paginate = PaginationService.new(page: params[:page], size: params[:size])
      http_client = HttpService.new

      return_all_launches = ::Usecases::ReturnAllLaunches.new(http_client)
      response = return_all_launches.call()

      parsed_response = parse_response(response)
      @launches = paginate.paginate(parsed_response)
      
      render :all_launches, status: :ok
    end

    def upcoming_launches
      paginate = PaginationService.new(
        page: params[:page],
        size: params[:size]
      )
      http_client = HttpService.new

      return_upcoming_launches = ::Usecases::ReturnUpcomingLaunches.new(http_client)
      response = return_upcoming_launches.call()
      
      parsed_response = parse_response(response)
      @launches = paginate.paginate(parsed_response)

      render :upcoming_launches, status: :ok
    end

    def past_launches
      paginate = PaginationService.new(
        page: params[:page],
        size: params[:size]
      )
      http_client = HttpService.new

      return_past_launches = ::Usecases::ReturnPastLaunches.new(http_client)
      response = return_past_launches.call()
      parsed_response = parse_response(response)
      @launches = paginate.paginate(parsed_response)
    
      render :past_launches, status: :ok
    end

    def next_launch
      http_client = HttpService.new
      return_next_launch = ::Usecases::ReturnNextLaunch.new(http_client)
      response = return_next_launch.call
      @launch = parse_response(response)
      render :next_launch , status: :ok
    end

    def latest_launch
      http_client = HttpService.new
      return_latest_launch = ::Usecases::ReturnLatestLaunch.new(http_client)
      response = return_latest_launch.call()
      @launch = parse_response(response)
      render :latest_launch, status: :ok
    end

    private 

    def parse_response(response)
      JSON.parse(response)
    end

  end
end