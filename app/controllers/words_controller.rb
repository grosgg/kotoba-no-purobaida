class WordsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  # GET /words
  # GET /words.json
  def index
    @words = Word.where(:user => current_user).desc(:_id).page(params[:page])
  end

  # GET /words/1
  # GET /words/1.json
  def show
    check_access
    @big_word = @word.hiragana if @word.hiragana and !@word.hiragana.empty?
    @big_word = @word.katakana if @word.katakana and !@word.katakana.empty?
    @big_word = @word.kanji if @word.kanji and !@word.kanji.empty?
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
    check_access
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)
    @word.user = current_user

    respond_to do |format|
      if @word.save
        handle_tags
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render action: 'show', status: :created, location: @word }
      else
        format.html { render action: 'new' }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    check_access
    tags_before_change = @word.tags
    respond_to do |format|
      if @word.update(word_params)
        handle_tags(tags_before_change)
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    check_access
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url }
      format.json { head :no_content }
    end
  end

  def search
    @search = params[:search]
    @words = Word.full_text_search(@search)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:english, :french, :hiragana, :katakana, :kanji, :tags, :tags_list)
    end

    def check_access
      redirect_to words_path, alert: "This word doesn't exist." if @word.user != current_user
    end

    def handle_tags(tags_before_change = false)
      if tags_before_change
        tags_before_change.each do |tag_name|
          Rails.logger.info "Remove tag '#{tag_name}' from word '#{@word.english}'"
          tag = Tag.where(:name => tag_name, :user => current_user).first
          if tag
            tag.count-=1
            tag.save
          end
        end
      end

      @word.tags.each do |tag_name|
        Rails.logger.info "Add tag '#{tag_name}' to  word '#{@word.english}'"
        tag = Tag.find_or_create_by(:name => tag_name, :user => current_user)
        tag.count+=1
        tag.save
      end
    end
end
