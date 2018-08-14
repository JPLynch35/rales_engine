require 'rails_helper'

describe "Merchants API" do
  it "returns a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants.json'

    merchants = JSON.parse(response.body, symbolize_names: true)
    merchant = merchants.first

    expect(response).to be_successful
    expect(merchants.count).to eq(3)
    expect(merchant).to have_key(:name)
  end

  it "returns a one specific merchant" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}.json"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["id"]).to eq(id)
    expect(merchant["name"]).to eq('King King')
  end
end
