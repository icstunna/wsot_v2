class Stock < ApplicationRecord
  has_many :positions
  has_many :portfolios, :through => :positions
end
