class BlogController < ApplicationController
  def index
    @blog = Blog.new
    post1 = @blog.new_post
    post1.title = "Paint just applied"
    post1.body = "Paint just applied. It's a lovely orangey-purple!"
    post1.publish
    post2 = @blog.new_post(title: "Still Wet")
    post2.body = " Paint still quite wet, no bubbling"
    post2.publish
  end
end
