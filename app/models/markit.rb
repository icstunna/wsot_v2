require 'httparty'
require 'pp'

class Markit
  include HTTParty
  base_uri 'http://dev.markitondemand.com/Api/v2'

  def initialize(ticker)
    @option = { query: {symbol: ticker }}
  end

  def quote
    self.class.get("/quote", @option)
  end
end
