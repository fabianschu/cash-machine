module CustomersHelper
  def formal_customer(customer)
    if customer.company.empty?
      customer.first_name + ' ' + customer.second_name
    else
      customer.company
    end
  end

  def showCustomerName?(customer)
    unless @customer.company.empty?
      customer_full_name =  @customer.first_name + ' ' + @customer.second_name
      content_tag :li, class: "list-group-item d-flex justify-content-between" do
        content_tag(:strong, "Name: ") + content_tag(:span, customer_full_name)
      end
    end
  end
end
