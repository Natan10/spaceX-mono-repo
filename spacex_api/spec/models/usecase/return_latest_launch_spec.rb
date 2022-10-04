require "rails_helper"

RSpec.describe "Usecases::ReturnLatestLaunch", type: :model do

  let(:http_client) do
    http_client = HttpService.new
  end

  
  it 'should be return latest launch' do
    mock_response = {
        "id": "63161339ffc78f3b8567070c",
        "logo_small": "https://images2.imgbox.com/a9/9a/NXVkTZCE_o.png",
        "logo_large": "https://images2.imgbox.com/e3/cc/hN96PmST_o.png",
        "video": "https://youtu.be/VVu2bSJJhgI",
        "article": nil,
        "wiki": nil,
        "success": true,
        "details": nil,
        "name": "Starlink 4-35 (v1.5)",
        "date": "2022-09-24T23:30:00.000Z",
        "date_local": "2022-09-24T19:30:00-04:00",
        "fire_date": nil
    }


    allow(http_client).to receive(:get).and_return(JSON.generate(mock_response))

    return_next_launch = Usecases::ReturnLatestLaunch.new(http_client)
    response = return_next_launch.call
    
    parse_response = JSON.parse(response)

    expect(parse_response["id"]).to eq(mock_response[:id]) 
    expect(parse_response["name"]).to eq(mock_response[:name]) 
  end
end