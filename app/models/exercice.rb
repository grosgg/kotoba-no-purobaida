class Exercice

  def initialize(user_id, tags = [], is_or = true, pages = 1, type = 'hiragana')
    @user = User.find(user_id)
    @tags = tags
    @is_or = is_or
    @pages = pages
    @type = type 
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

  def type
    @type
  end

end