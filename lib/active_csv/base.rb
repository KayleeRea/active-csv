require 'csv'

module ActiveCSV
  class Base
    def initialize(row=nil)
      @row = row
    end

    def method_missing(method_name)
      if @row.include? (method_name.to_s)
        return @row.field(method_name.to_s)
      else
        raise "Error, no #{method_name} method"
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      if @row.include?(method_name.to_s)
        true
      else
        super
      end
    end
  end
end