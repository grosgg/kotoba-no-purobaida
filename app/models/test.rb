class Test < Exercice

  def generate(from, to)
    puts from+' to '+to
    scope_from = 'with_'+from
    scope_to = 'with_'+to
    
    words = Word.send(scope_from).send(scope_to).where(
      :user => @user,
      :tags.in => @tags,
    ).limit(25*@pages)


    word_grid = []
    words.each do |w|
      word_grid.push [w[from], w[to]]
    end
    word_grid
  end
end
