require "rails_helper"

RSpec.describe "Usecases::ReturnNextLaunch", type: :model do

  let(:http_client) do
    http_client = HttpService.new
  end

  
  it 'should be return next launch' do
    mock_response = {
        "id": "62dd70d5202306255024d139",
        "logo_small": nil,
        "logo_large": nil,
        "video": nil,
        "article": nil,
        "wiki": nil,
        "success": nil,
        "details": nil,
        "name": "Crew-5",
        "date": "2022-10-05T16:00:00.000Z",
        "date_local": "2022-10-05T12:00:00-04:00",
        "fire_date": nil
    }


    allow(http_client).to receive(:get).and_return(JSON.generate(mock_response))

    return_next_launch = Usecases::ReturnNextLaunch.new(http_client)
    response = return_next_launch.call
    
    parse_response = JSON.parse(response)

    expect(parse_response["id"]).to eq(mock_response[:id]) 
    expect(parse_response["date"]).to eq(mock_response[:date]) 
  end
end