require 'net/http'
require 'json'

class RequestHelper
  GITHUB_URI = 'https://api.github.com/'.freeze
  IDENTIFIER_FOR_SINGLE_ROUTE = '{'.freeze

  protected

  def self.get_data(url)
    url = array_url(url)
    uri = URI.parse(url )
    res = Net::HTTP.get (uri)
    JSON.parse(res, symbolize_names: true)
  end

  def self.array_url(url) # removes {id} string in urls
    index = url.index(IDENTIFIER_FOR_SINGLE_ROUTE) || url.size
    url[0, index]
  end
end