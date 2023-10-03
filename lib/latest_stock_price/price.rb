require 'uri'
require 'net/http'

module Price
  def price(indices:, identifier: nil)
    url = URI("#{base_url}/price")
    url.query = URI.encode_www_form({ 'Indices': indices, 'Identifier': identifier })

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = rapidapi_key
    request["X-RapidAPI-Host"] = host

    response = http.request(request)
    puts response.read_body
  end
end