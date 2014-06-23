class Normalizer < ActiveCSV::Base
  def initialize(row)
    @row = row
    string = @row.headers.first
    normalized_string = string.downcase.split(' ').join('_')
    @row << [normalized_string, @row.field(string)]
    @row.delete(string)
  end
end