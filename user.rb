require 'net/http'
require 'json'

class User

  def self.from_username username
    uri = URI.parse "https://api.github.com/users/#{username}"
    res = Net::HTTP.get uri
    new JSON.parse(res, symbolize_names: true)
  end

  def initialize data
    @data = data
  end

  def login
    @data[:login]
  end

  def name
    @data[:name]
  end

  def email
    @data[:email]
  end

  def followers
    uri = URI.parse @data[:followers_url]
    res = Net::HTTP.get uri
    data = JSON.parse(res, symbolize_names: true)
    data.map { |d| User.new d }
  end

end
