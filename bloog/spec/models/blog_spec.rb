require 'minitest/autorun'
require_relative '../../app/models/blog'
require 'ostruct'

describe Blog do
  before do
    @it = Blog.new
  end
  it "has no entries" do
    @it.entries.must_be_empty
  end

  describe "#new_post" do
    before do
      @new_post = OpenStruct.new
      @it.post_source = ->{ @new_post}
    end
    it "returns a new post" do
      @it.new_post.must_equal @new_post
    end
    it "sets the post's blog reference to itself" do
      @it.new_post.blog.must_equal @it
    end
  end
end