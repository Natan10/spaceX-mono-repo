require "rails_helper"

RSpec.describe "Usecases::ReturnAllLaunches", type: :model do

  let(:http_client) do
    http_client = HttpService.new
  end

  
  it 'should not be return launches' do
    allow(http_client).to receive(:get).and_return(JSON.generate([]))

    return_all_launches = Usecases::ReturnAllLaunches.new(http_client)
    response = return_all_launches.call
  
    parse_response = JSON.parse(response)
    expect(parse_response.length).to eq(0) 
  end

  it 'should be return all launches' do 
    mock_response = [
      {
        "id": "5eb87ce1ffd86e000604b334",
        "logo_small": "https://images2.imgbox.com/f8/27/XwZPEhTJ_o.png",
        "logo_large": "https://images2.imgbox.com/ae/62/D6SZleUG_o.png",
        "video": "https://www.youtube.com/watch?v=uFefasS6bhc",
        "article": "http://www.parabolicarc.com/2013/09/29/falcon-9-launch-payloads-orbit-vandenberg/",
        "wiki": "https://en.wikipedia.org/wiki/CASSIOPE",
        "success": true,
        "details": "Commercial mission and first Falcon 9 v1.1 flight, with improved 13-tonne to LEO capacity. Following second-stage separation from the first stage, an attempt was made to perform an ocean touchdown test of the discarded booster vehicle. The test provided good test data on the experiment-its primary objective-but as the booster neared the ocean, aerodynamic forces caused an uncontrollable roll. The center engine, depleted of fuel by centrifugal force, shut down resulting in the impact and destruction of the vehicle.",
        "name": "CASSIOPE",
        "date": "2013-09-29T16:00:00.000Z",
        "date_local": "2013-09-29T09:00:00-07:00",
        "fire_date": "2013-09-19T00:00:00.000Z"
      },
      {
        "id": "5eb87ce2ffd86e000604b335",
        "logo_small": "https://images2.imgbox.com/4e/f8/rqu7XWMF_o.png",
        "logo_large": "https://images2.imgbox.com/41/b7/H6vprzuB_o.png",
        "video": "https://www.youtube.com/watch?v=aAj5xapImEs",
        "article": "https://www.nasaspaceflight.com/2013/12/spacex-falcon-9-v1-1-milestone-ses-8-launch/",
        "wiki": "https://en.wikipedia.org/wiki/SES-8",
        "success": true,
        "details": "First GTO launch for Falcon 9",
        "name": "SES-8",
        "date": "2013-12-03T22:41:00.000Z",
        "date_local": "2013-12-03T18:41:00-04:00",
        "fire_date": "2013-11-22T06:26:00.000Z"
      }
    ]

    allow(http_client).to receive(:get).and_return(JSON.generate(mock_response))

    return_all_launches = Usecases::ReturnAllLaunches.new(http_client)
    response = return_all_launches.call
  
    parse_response = JSON.parse(response)

    expect(parse_response.length).to eq(2) 
    expect(parse_response[0]["id"]).to eq(mock_response[0][:id])
    expect(parse_response[1]["id"]).to eq(mock_response[1][:id])
  end
  
end