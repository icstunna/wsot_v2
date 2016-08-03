class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.belongs_to :portfolio, index: true
      t.belongs_to :stock, index: true
      t.decimal :open_price, :precision => 12, :scale => 2
      t.decimal :close_price, :precision => 12, :scale => 2
      t.integer :quantity

      t.timestamps
    end
  end
end
