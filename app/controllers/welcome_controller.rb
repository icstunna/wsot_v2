class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @portfolios = Portfolios.all
  end
end
