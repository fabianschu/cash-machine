class InvoicePdfsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "index",
        disposition: 'attachment'
      end
    end
  end
end
