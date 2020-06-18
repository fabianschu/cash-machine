class AddInvoiceToPositions < ActiveRecord::Migration[6.0]
  def change
    add_reference :positions, :invoice, null: false, foreign_key: true
  end
end
