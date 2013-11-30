class Study < Exercice

  def generate
    puts tags
    words = Word.where(:user => @user, :tags.in => @tags)
    
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
        word_grid.push [w.katakana, '', w.english]
      elsif w.kanji && !w.kanji.empty?
        word_grid.push [w.kanji, w.hiragana ? w.hiragana : '', w.english]
      else
        word_grid.push [w.hiragana, '', w.english]
      end
    end
    word_grid
  end

end