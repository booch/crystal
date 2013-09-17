require 'spec_helper'

describe 'Type inference: struct' do
  it "types struct" do
    mod, type = assert_type("struct Foo; end; Foo.new") { types['Foo'] }
    mod.types['Foo'].should be_struct
  end

  it "types struct metaclass" do
    mod, type = assert_type("struct Foo; end; Foo") { types['Foo'].metaclass }
  end
end
