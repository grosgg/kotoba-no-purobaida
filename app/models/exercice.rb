class Exercice
  include ActiveModel::Validations

  attr_accessor :tags, :is_or, :pages

  def initialize(user_id, params = {})
    @user = User.find(user_id)
    # puts "!!! #{params}"
    @tags = params[:tags] ? params[:tags] : []
    @is_or = params[:is_or] ? params[:is_or] : true
    @pages = params[:pages] ? params[:pages].to_i : 1
  end

end