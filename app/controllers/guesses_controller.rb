class GuessesController < ApplicationController
  before_filter :authenticate_user!

  # GET /guesses/new
  def new
    @options = [
      ['English', 'english'],
      ['Français', 'french'],
      ['漢字', 'kanji'],
      ['ひらがな', 'hiragana'],
      ['カタカナ', 'katakana']
    ]
  end

  # POST /guesses
  def create
    tags = params[:tags].split(',').map { |v| v.strip }

    guess = Guess.new(current_user.id, {
      tags: tags,
      is_or: params[:is_or],
      pages: params[:pages],
      from: params[:from],
      to: params[:to]
    })
    
    if !guess.valid?
      redirect_to new_guess_path, alert: guess.errors.first.last
    end

    @word_grid = guess.generate()
    @from = guess.from
    @to = guess.to

    kit = PDFKit.new(render_to_string layout: false)
    pdf = kit.to_pdf

    send_data pdf, filename: "Guess #{current_user.name} #{Date.today.to_s}.pdf", type: "application/pdf"
  end

end
