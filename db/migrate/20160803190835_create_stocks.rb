class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.decimal :current_price, :precision => 12, :scale => 2 

      t.timestamps
    end
  end
end
