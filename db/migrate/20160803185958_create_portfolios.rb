class CreatePortfolios < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolios do |t|
      t.belongs_to :user, index: true
      t.decimal :cash, :precision => 12, :scale => 2
      
      t.timestamps
    end
  end
end
