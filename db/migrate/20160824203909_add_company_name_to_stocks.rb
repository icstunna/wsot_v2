class AddCompanyNameToStocks < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :company_name, :string
  end
end
