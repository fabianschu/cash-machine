module InvoicesHelper
  def invoice_total(invoice)
    invoice.positions.to_ary.reduce(0) { | sum, position | sum + position_total(position)}
  end

  def invoice_number(invoice)
    6000 + invoice.id * 3
  end

  def today
    date = Date.today
    date&.strftime('%d|%m|%Y')
  end
end
