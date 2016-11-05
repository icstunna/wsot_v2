class PositionsController < ApplicationController
  # skip_before_filter :verify_authenticity_token  #http://stackoverflow.com/questions/3364492/actioncontrollerinvalidauthenticitytoken

  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @position = Position.new
  end

  def create
    ticker = params[:position][:stock].upcase
    @stock = Stock.where(ticker: ticker).take
    if @stock == nil 
      @quote = Markit.new.quote(ticker)
      @stock = Stock.create(ticker: ticker, 
                        company_name: @quote['StockQuote']['Name'],
                        current_price: @quote['StockQuote']['Open'].to_f)
    end
    @portfolio = Portfolio.find(params[:portfolio_id])
    @position = Position.new(positions_params)
    @position.stock_id = @stock.id
    @position.portfolio_id = @portfolio.id
    @position.save

    redirect_to portfolio_path(@portfolio)
  end
  
  def show
    @position = Position.find(params[:id].to_i)
  end

  def lookup
    @lookup = Markit.new.lookup(params[:lookup])
   
    render :json => {results: @lookup}
  end

  def destroy
    @position = Position.where(id: params[:id]).take
    @quote = Markit.new.quote(@position.stock.ticker)
    @position.close_price = @quote['StockQuote']['Open'].to_f
    @position.save
    
    @portfolio = Portfolio.where(id: params[:portfolio_id]).take
    @portfolio.cash += @position.close_price
        
    redirect_to portfolio_url(id: params[:portfolio_id])
  end
  
  private

  def positions_params
    params.require(:position).permit(:open_price, :quantity)
  end
end
