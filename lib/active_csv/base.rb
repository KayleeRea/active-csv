require 'csv'

module ActiveCSV
  class Base
      def initialize(row=nil)
        @row = row
      end
    def method_missing(method_name)
      @row.field(method_name.to_s) || super
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