class PortfoliosController < ApplicationController
  before_action :authenticate_user!

  def index
    @portfolios = Portfolio.where(user_id: current_user.id)
  end

  def new
  end
end
