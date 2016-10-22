require 'httparty'
require 'pp'

class Markit
  include HTTParty
  base_uri 'http://dev.markitondemand.com/Api/v2'

  # def initialize
  # end

  def quote(ticker)
    @option = { query: {symbol: ticker }}
    self.class.get("/quote", @option)
  end

  def lookup(company)
    @lookup = { query: {input: company }}
    self.class.get("/lookup", @lookup)
  end
end

quote = Markit.new.quote('aapl')
pp quote
