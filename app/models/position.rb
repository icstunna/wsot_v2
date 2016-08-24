class Position < ApplicationRecord
  belongs_to :portfolio
  belongs_to :stock

  def profit_loss
    open_balance = self.quantity * self.open_price
    current_balance = self.stock.current_price * self.quantity

    return open_balance - current_balance
  end

  def balance
    self.stock.current_price * self.quantity
  end

end
