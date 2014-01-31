#!/usr/bin/env bin/crystal --run
require "spec"
require "date"

describe "Date" do
  it "initializes from year, month, day" do
    date = Date.new(2014, 1, 31)
  end

  it "prints in yyyy-mm-dd format" do
    date = Date.new(2014, 1, 31)
    date.to_s.should eq("2014-01-31")
  end
end
