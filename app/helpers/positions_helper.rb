module PositionsHelper
  def position_total(position)
    invoice = Invoice.find(position.invoice_id)
    customer = Customer.find(invoice.customer_id)
    position.hours.to_f * customer.hourly_rate.to_f
  end
end
