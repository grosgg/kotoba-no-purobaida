class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @recent_kanji = Word.where(:user => current_user).with_kanji.order_by(:id => :desc).limit(10)
    @recent_katakana = Word.where(:user => current_user).with_katakana.order_by(:id => :desc).limit(10)
    @recent_hiragana = Word.where(:user => current_user).with_hiragana.without_kanji.order_by(:id => :desc).limit(10)

    @popular_tags = Tag.where(:user => current_user).order_by(:count => :desc).limit(20)
  end
end
