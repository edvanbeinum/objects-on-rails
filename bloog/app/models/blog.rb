class Blog
  attr_reader :entries
  def initialize
    @entries = []
  end
  def title
    "Watching Paint Dry"
  end
  def subtitle
    "The trusted source for paint drying news and opinion"
  end
end