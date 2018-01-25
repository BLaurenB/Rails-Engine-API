class Merchant < ApplicationRecord
  validates :name, :created_at, :updated_at, presence: true
  default_scope {order(:id)}

  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  has_many :items
  has_many :invoice_items, through: :items

  def favorite_customer
    customers
      .joins(invoices: :transactions)
      .merge(Transaction.success)
      .group("customers.id")
      .order("COUNT(transactions) DESC").first
  end

  def self.revenue_by_date(date)
    Merchant.unscoped
      .joins(invoices: [:invoice_items, :transactions])
      .merge(Transaction.unscoped.success)
      .group("invoices.updated_at")
      .where(invoices: {updated_at: date..date+1})
      .sum("invoice_items.quantity * invoice_items.unit_price")
      .values
      .sum
    # has to be converted to currency, but working
    # date.beginning_of_day
    # date.end_of_day
  end

  def total_revenue
    # GET /api/v1/merchants/:id/revenue
    invoice_items
    .joins(:transactions)
    .merge(Transaction.unscoped.success)
    .sum("quantity * invoice_items.unit_price")
    #need to convert currency
  end

  def total_revenue_on_date(date)


    # invoice_items
    #   .joins(:invoice)
    #   .where("invoices.created_at = ?", params[:date])
    #   .sum("quantity * invoice_items.unit_price")

    invoice_items
    .joins(:transactions)
    .merge(Transaction.unscoped.success)
    .where(invoices: {updated_at: date.beginning_of_day..date.end_of_day})
    .sum("invoice_items.quantity * invoice_items.unit_price")
    #
    # date.beginning_of_day
    # date.end_of_day
  end



end
