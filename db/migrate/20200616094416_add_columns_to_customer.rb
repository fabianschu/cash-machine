class AddColumnsToCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :company, :string
    add_column :customers, :first_name, :string
    add_column :customers, :second_name, :string
    add_column :customers, :street, :string
    add_column :customers, :zip, :string
    add_column :customers, :country, :string
    add_column :customers, :hourly_rate, :string
  end
end
