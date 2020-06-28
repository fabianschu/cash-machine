module InvoicesHelper
  def invoice_total(positions)
    positions.to_ary.reduce(0) { | sum, position | sum + position_total(position)}
  end
end
