class InvoicesController < ApplicationController
  def new
    @customer = Customer.find(params[:customer_id])
    @invoice = @customer.invoices.build
    @path = [@customer, @invoice]
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @invoice = @customer.invoices.new(invoice_params)
    if @invoice.save
      redirect_to @invoice
    else
      redirect_to new_customer_invoice_path
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def edit
    @invoice = Invoice.find(params[:id])
    @path = @invoice
  end

  private
    def invoice_params
      params.require(:invoice).permit(:name)
    end
end