require "spec"
require "json"

describe "Json serialization" do
  describe "from_json" do
    it "does Array(Nil)#from_json" do
      Array(Nil).from_json("[null, null]").should eq([nil, nil])
    end

    it "does Array(Bool)#from_json" do
      Array(Bool).from_json("[true, false]").should eq([true, false])
    end

    it "does Array(Int32)#from_json" do
      Array(Int32).from_json("[1, 2, 3]").should eq([1, 2, 3])
    end

    it "does Array(Int64)#from_json" do
      Array(Int64).from_json("[1, 2, 3]").should eq([1, 2, 3])
    end

    it "does Array(Float32)#from_json" do
      Array(Float32).from_json("[1.5, 2, 3.5]").should eq([1.5, 2.0, 3.5])
    end

    it "does Array(Float64)#from_json" do
      Array(Float64).from_json("[1.5, 2, 3.5]").should eq([1.5, 2, 3.5])
    end

    it "does Hash(String, String)#from_json" do
      Hash(String, String).from_json(%({"foo": "x", "bar": "y"})).should eq({"foo" => "x", "bar" => "y"})
    end

    it "does Hash(String, Int32)#from_json" do
      Hash(String, Int32).from_json(%({"foo": 1, "bar": 2})).should eq({"foo" => 1, "bar" => 2})
    end

    it "does Hash(String, Int32)#from_json and skips null" do
      Hash(String, Int32).from_json(%({"foo": 1, "bar": 2, "baz": null})).should eq({"foo" => 1, "bar" => 2})
    end
  end

  describe "to_json" do
    it "does for Nil" do
      nil.to_json.should eq("null")
    end

    it "does for Bool" do
      true.to_json.should eq("true")
    end

    it "does for Int32" do
      1.to_json.should eq("1")
    end

    it "does for Float64" do
      1.5.to_json.should eq("1.5")
    end

    it "does for String" do
      "hello".to_json.should eq("\"hello\"")
    end

    it "does for String with quote" do
      "hel\"lo".to_json.should eq("\"hel\\\"lo\"")
    end

    it "does for Array" do
      [1, 2, 3].to_json.should eq("[1,2,3]")
    end

    it "does for Hash" do
      {"foo" => 1, "bar" => 2}.to_json.should eq(%({"foo":1,"bar":2}))
    end
  end
end
