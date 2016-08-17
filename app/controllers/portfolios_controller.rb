class PortfoliosController < ApplicationController
  before_action :authenticate_user!

  def index
    @portfolios = Portfolio.where(user_id: current_user.id)
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user_id = current_user.id
    @portfolio.save
    
    redirect_to portfolios_url
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:fund_name, :cash)
  end
end

