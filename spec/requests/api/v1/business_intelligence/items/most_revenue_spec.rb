require 'rails_helper'

describe "User visits /items/most_revenue" do
  it "returns a list of items based on total generate revenue" do
    create_list(:item, 10)

    get '/api/v1/items/most_revenue?quantity=5'

    items = JSON.parse(response.body)

  end
end
# GET /api/v1/items/most_revenue?quantity=x
# returns the top x items ranked by total revenue generated
=begin
table should return items.*
revenue is invoice_item.quantity * invoice_item.unit_price
select items, sum(X*X) as revenue
from items to item invoice_items
order by revenue desc,
limit by variable (which is quantity)

Item.select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue").joins(:invoice_items [:invoices, :transactions]).merge(Transaction.successful_transactions).group(:id).order("revenue DESC").limit(2)

ex: Merchant.invoice_items.joins(:transactions).merge(Transaction.successful_transactions).sum("quantity * invoice_items.unit_price")


maybe try Item.invoice_items.


=end
