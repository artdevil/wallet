require 'uri'
require 'net/http'

module Prices
  def prices(indices:, identifier: nil)
    url = URI("#{base_url}/price")
    url.query = URI.encode_www_form({ 'Indices': indices, 'Identifier': identifier })

    call(url)
  end
end