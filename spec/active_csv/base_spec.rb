require 'rspec'
require 'active_csv/base'
require 'csv'
require 'active_csv/normalizer'

describe ActiveCSV::Base do

  it "can be initialized with nothing" do
    active_csv = ActiveCSV::Base.new
    expect(active_csv).to be_kind_of(ActiveCSV::Base)
  end

  describe "attribute readers" do
    it "defines an attribute reader for every column in the csv" do
      row = CSV::Row.new(["name", "age"], ["joe", "24"])

      active_csv = ActiveCSV::Base.new(row)

      expect(active_csv.name).to eq("joe")
      expect(active_csv.age).to eq("24")
    end
  end


  describe ".file_path" do
    it "allows you to set the file path to the CSV" do
      pending
      klass = Class.new(ActiveCSV::Base) do
        self.file_path = "foo"
      end
      expect(klass.file_path).to eq("foo")
    end
  end

  describe "nil" do
    it "returns nil if the field name is nil" do
      row = CSV::Row.new(["name", "age"], [nil, "24"])

      active_csv = ActiveCSV::Base.new(row)

      expect(active_csv.name).to eq nil
    end
  end

  describe "normalize" do
    it "normalizes the headers" do
      instance = Normalizer.new(CSV::Row.new(["FIrst   NAme  "], ["Joe"]))

      expect(instance.first_name).to eq "Joe"
    end
  end

  describe "respond_to_missing?" do
    it "returns true" do
      row = CSV::Row.new(["name", "age"], ["joe", nil])

      active_csv = ActiveCSV::Base.new(row)

      expect(active_csv.respond_to?(:name)).to eq true
      expect(active_csv.respond_to?(:age)).to eq true
    end
  end

end