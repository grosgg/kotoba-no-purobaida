class Exercice
  include ActiveModel::Validations

  def initialize(user_id, params)
    @user = User.find(user_id)
    # puts "!!! #{params}"
    @tags = tags ? params[:tags] : []
    @is_or = is_or ? params[:is_or] : true
    @pages = pages ? params[:pages].to_i : 1
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