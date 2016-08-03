class AddNameToPortfolioAndTickerToStock < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :fund_name, :string
    add_column :stocks, :ticker, :string
  end
end
