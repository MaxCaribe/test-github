module MethodDefiner
  COUNT_STRING = '_count'.freeze
  URL_STRING = '_url'.freeze
  ID_STRING = 'id'.freeze

  def defined_methods(data) # according to values and keys determines whether we need object or attribute
    @data = data
    data.each do |key, value|
      if value.is_a?(Numeric) && key.to_s != ID_STRING
        define_singleton_method(key.to_s + COUNT_STRING) { value }
      elsif key.to_s.include?(URL_STRING)
        method_name = key[0..-5]
        define_singleton_method(method_name) { Builder.get_list(method_name, @data[key.to_sym]) }
      else
        define_singleton_method(key) { @data[key.to_sym] }
      end
    end
  end
end