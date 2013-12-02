class TestsController < ApplicationController
  before_filter :authenticate_user!

  # GET /tests/new
  def new
    @options = [
      ['English', 'english'],
      ['Français', 'french'],
      ['漢字', 'kanji'],
      ['ひらがな', 'hiragana'],
      ['カタカナ', 'katakana']
    ]
  end

  # POST /tests
  def create
    tags = params[:tags].split(',').map { |v| v.strip }
    is_or = params[:is_or] == 'true' ? true : false
    @from = params[:from]
    @to = params[:to]

    @test = Test.new(current_user.id, tags, is_or, params[:pages])
    @word_grid = @test.generate(@from, @to)

    kit = PDFKit.new(render_to_string layout: false)
    pdf = kit.to_pdf

    send_data pdf, filename: "Test #{current_user.name} #{Date.today.to_s}.pdf", type: "application/pdf"
  end
end
