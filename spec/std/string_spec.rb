require 'spec_helper'

describe 'Stdlib: String' do
  it 'compare strings: different length' do
    run('"a" == "aa"', load_std: ['c', 'string']).to_b.should be_false
  end

  it 'compare strings: same length, same string' do
    run('"foo" == "foo"', load_std: ['c', 'string']).to_b.should be_true
  end

  it 'compare strings: same length, different string' do
    run('"foo" == "bar"', load_std: ['c', 'string']).to_b.should be_false
  end
end