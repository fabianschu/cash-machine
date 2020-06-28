class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  
  def index
    redirect_to customer_path(params[:customer_id])
  end

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
    @customer = Customer.find(@invoice.customer_id)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "invoice_pdf",
        layout: "pdf"
      end
    end
  end

  def edit
    @path = @invoice
  end

  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def invoice_pdf
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "invoice_pdf",
        layout: "pdf"
      end
    end
  end

  private
    def invoice_params
      params.require(:invoice).permit(:name, :created_at, :updated_at)
    end

    def set_invoice
      @invoice = Invoice.find(params[:id])
    end
end