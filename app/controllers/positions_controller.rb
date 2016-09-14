class PositionsController < ApplicationController
  # skip_before_filter :verify_authenticity_token  #http://stackoverflow.com/questions/3364492/actioncontrollerinvalidauthenticitytoken

  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @position = Position.new
  end

  def create
    ticker = params[:position][:stock].upcase
    @stock = Stock.where(ticker: ticker).take
    @portfolio = Portfolio.find(params[:portfolio_id])
    @position = Position.new(positions_params)
    @position.stock_id = @stock.id
    @position.portfolio_id = @portfolio.id
    @position.save

    redirect_to portfolio_path(@portfolio)
  end

  def lookup
    @lookup = Markit.new.lookup(params[:lookup])
   
    render :json => {results: @lookup}
  end

  private

  def positions_params
    params.require(:position).permit(:open_price, :quantity)
  end
end
