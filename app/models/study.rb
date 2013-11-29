class Study

  def initialize(user_id, tags = [], is_or = false, pages = 1)
    @tags = tags
    @is_or = is_or
    @pages = pages
    @user = User.find(user_id) 
  end

  def tags
    @tags
  end

  def is_or
    @is_or
  end

  def pages
    @pages
  end

  def generate
    puts tags
    if @is_or
      words = Word.where(:user => @user, :tags.in => @tags)
    else
      words = Word.where(:user => @user, :tags.in => @tags)
      # words = Word.in(tags: ['drinks']).also_in(tags: ['easy'])
      # @tags.each do |t|
      #   puts words
      #   words = words.and(:tags.in => t)
      # end
    end
    words
  end

end