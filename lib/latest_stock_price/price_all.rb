require 'uri'
require 'net/http'

module PriceAll
  def price_all(identifier: nil)
    url = URI("#{base_url}/any")
    url.query = URI.encode_www_form({ 'Identifier': identifier })

    call(url)
  end
end