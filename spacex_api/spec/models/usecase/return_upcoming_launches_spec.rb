require "rails_helper"

RSpec.describe "Usecases::ReturnUpcomingLaunches", type: :model do

  let(:http_client) do
    http_client = HttpService.new
  end

  
  it 'should not be return upcoming launches' do
    allow(http_client).to receive(:get).and_return(JSON.generate([]))

    return_all_launches = Usecases::ReturnUpcomingLaunches.new(http_client)
    response = return_all_launches.call
  
    parse_response = JSON.parse(response)
    expect(parse_response.length).to eq(0) 
  end

  it 'should be return upcoming launches' do 
    mock_response = [
      {
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
      },
      {
        "id": "63161345ffc78f3b8567070d",
        "logo_small": "https://images2.imgbox.com/a9/9a/NXVkTZCE_o.png",
        "logo_large": "https://images2.imgbox.com/e3/cc/hN96PmST_o.png",
        "video": nil,
        "article": nil,
        "wiki": nil,
        "success": nil,
        "details": nil,
        "name": "Starlink 4-36 (v1.5)",
        "date": "2022-10-20T00:00:00.000Z",
        "date_local": "2022-10-19T20:00:00-04:00",
        "fire_date": nil
      },
      {
        "id": "6243aec2af52800c6e91925d",
        "logo_small": nil,
        "logo_large": nil,
        "video": nil,
        "article": nil,
        "wiki": nil,
        "success": nil,
        "details": nil,
        "name": "USSF-44",
        "date": "2022-10-21T00:00:00.000Z",
        "date_local": "2022-10-20T20:00:00-04:00",
        "fire_date": nil
      }
    ]

    allow(http_client).to receive(:get).and_return(JSON.generate(mock_response))

    return_upcoming_launches = Usecases::ReturnUpcomingLaunches.new(http_client)
    response = return_upcoming_launches.call
  
    parse_response = JSON.parse(response)
    expect(parse_response.length).to eq(3) 
    expect(parse_response[0]["id"]).to eq(mock_response[0][:id])
    expect(parse_response[1]["id"]).to eq(mock_response[1][:id])
    expect(parse_response[2]["id"]).to eq(mock_response[2][:id])
  end
  
end