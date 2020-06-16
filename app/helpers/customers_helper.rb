module CustomersHelper
  def formal_customer(customer)
    if customer.company.empty?
      customer.first_name + ' ' + customer.second_name
    else
      customer.company
    end
  end
end
