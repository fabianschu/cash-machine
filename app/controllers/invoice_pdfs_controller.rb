class InvoicePdfsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "index",
        layout: "pdf"
      end
    end
  end
end
