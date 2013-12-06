class Practice < Exercice

  def generate
    words = Word.where(:user => @user)

    unless @tags.empty?
      words = words.where(:tags.in => @tags)
    end

    words = words.limit(25*@pages)
    
    #TODO: Find a way to search words with all provided tags
    # if @is_or
    #   words = Word.where(:user => @user, :tags.in => @tags)
    # else
    #   words = Word.in(tags: ['drinks']).also_in(tags: ['easy'])
    #   @tags.each do |t|
    #     puts words
    #     words = words.and(:tags.in => t)
    #   end
    # end

    word_grid = []
    words.each do |w|
      if w.katakana && !w.katakana.empty?
        word_grid.push [w.english, w.katakana]
      elsif w.kanji && !w.kanji.empty?
        word_grid.push [w.english, w.hiragana, w.kanji]
      else
        word_grid.push [w.english, w.hiragana]
      end
    end
    word_grid
  end

end