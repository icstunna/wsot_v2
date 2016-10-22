class JournalsController < ApplicationController
  
  def new
    @portfolio = Portfolio.find(params[:portfolio_id].to_i)
    @position = Position.find(params[:position_id].to_i)
    @journal = Journal.new
  end
  
  def create
    @position = Position.find(params[:position_id])
    @journal = Journal.new(journal_params)
    @journal.position_id = @position.id
    @journal.save
    
    redirect_to portfolio_position_url(portfolio_id: params[:portfolio_id], id: @position.id)
  end
  
  def show
    @journal = Journal.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  def delete
  end
  
  private
  
  def journal_params
    params.require(:journal).permit(:title, :entry)
  end
end
