require './request_helper'
require './method_definer'
require './builder'

class User < RequestHelper
  GITHUB_URI_FOR_USER = "#{GITHUB_URI}users/".freeze

  include MethodDefiner

  def self.from_username(username)
    new(get_data(GITHUB_URI_FOR_USER + username))
  end

  def initialize(data)
    defined_methods(data)
  end
end
