require 'latest_stock_price/price_all'
require 'latest_stock_price/prices'
require 'latest_stock_price/price'

class LatestStockPrice
  include PriceAll
  include Prices
  include Price

  attr_reader :rapidapi_key

  def initialize(rapidapi_key)
    @rapidapi_key = rapidapi_key
  end

  def base_url
    'https://latest-stock-price.p.rapidapi.com'
  end

  def host
    base_url.gsub('https://', '')
  end
end