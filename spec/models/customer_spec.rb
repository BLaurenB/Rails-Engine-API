require 'rails_helper'

describe Customer do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:first_name)}
    it {is_expected.to validate_presence_of(:last_name)}
    it {is_expected.to validate_presence_of(:created_at)}
    it {is_expected.to validate_presence_of(:updated_at)}
  end

  describe "Relationships" do
    it {is_expected.to have_many(:invoices)}
    it {is_expected.to have_many(:merchants).through(:invoices)}
  end

end
