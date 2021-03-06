#!/usr/bin/env bin/crystal --run
require "../../spec_helper"

describe "Type inference: static array" do
  it "types static array with var declaration" do
    assert_type("x :: Char[3]") { static_array_of(char, 3) }
  end
end
