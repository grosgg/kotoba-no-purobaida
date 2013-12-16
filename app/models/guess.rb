class Guess < Exercice
  attr_accessor :from, :to
  validate :languages_are_different

  def initialize(user_id, params = {})
    super(user_id, params)
    @from = params[:from] ? params[:from] : 'english'
    @to = params[:to] ? params[:to] : 'hiragana'
  end

  def generate
    Rails.logger.info "#{@from} to #{@to}"
    scope_from = "with_#{@from}"
    scope_to = "with_#{@to}"

    words = Word
      .send(scope_from)
      .send(scope_to)
      .where(:user => @user)

    unless @tags.empty?
      words = words.where(:tags.in => @tags)
    end

    words = words.to_a.shuffle.take(28 * @pages)

    word_grid = []
    words.each do |w|
      word_grid.push [w[@from], w[@to]]
    end
    word_grid
  end

  private

  def languages_are_different
    if @from == @to
      errors.add(:base, 'Selected languages must be different')
    end
  end
end
