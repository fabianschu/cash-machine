class InvoicesController < ApplicationController
  def new
    @customer = Customer.find(params[:customer_id])
    @invoice = Invoice.new
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @invoice = @customer.invoices.new(invoice_params)
    if @invoice.save
      puts 'yes!!!!!!!!'
    else
      puts 'no1!!!!!!!!'
    end
  end

  private
    def invoice_params
      params.require(:invoice).permit(:name)
    end
end