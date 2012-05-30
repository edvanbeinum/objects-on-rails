require 'minitest/autorun'
require_relative '../../app/models/blog'
describe Blog do
  before do
    @it = Blog.new
  end
  it "has no entries" do
    @it.entries.must_be_empty
  end
end