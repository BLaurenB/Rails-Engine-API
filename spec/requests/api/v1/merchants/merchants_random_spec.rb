require 'rails_helper'

describe "Merchant API" do
  it "can get a single random merchant from database" do
    merchant1, merchant2, merchant3 = create_list(:merchant, 3)
    merchants_ids = [merchant1.id, merchant2.id, merchant3.id]

    get "/api/v1/merchants/random.json"

    random_merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(merchants_ids.include?(random_merchant["id"])).to eq true
  end
end
