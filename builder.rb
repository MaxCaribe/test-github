require './request_helper'
require './method_definer'

class Builder < RequestHelper
  USER_TYPES = %w(followers, assignees) # not full list

  def self.get_list(key, value)
    if type_of_user?(key)
      type = 'User'
    else
      type = key.split('_').collect!{ |w| w.capitalize }.join
      define_class(type) unless Object.const_defined?(type)
    end

    data = get_data(value)
    array = []
    data&.each {|instance| array.push Object.const_get(type).send(:new, instance)}
    array
  end

  private

  def self.define_class(type)
    klass = Class.new do
      include MethodDefiner

      define_method(:initialize) {|data| defined_methods(data)}
    end

    Object.const_set(type, klass)
  end

  def self.type_of_user?(type)
    USER_TYPES.each {|user_type| return true if type.include?(user_type)}
    false
  end
end