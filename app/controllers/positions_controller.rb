class PositionsController < ApplicationController
  skip_before_filter :verify_authenticity_token  #http://stackoverflow.com/questions/3364492/actioncontrollerinvalidauthenticitytoken

  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @position = Position.new
  end

  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    @position = Position.create(open_price: params[:open_price], quantity: params[:quantity] )

    redirect_to portfolio_path(@portfolio)
  end

  def lookup
    @lookup = Markit.new.lookup(params[:lookup])
  
    render :json => {results: @lookup}
  end

  def positions_params
    params.require(:position).permit(:stock, :open_price, :quantity)
  end
end
