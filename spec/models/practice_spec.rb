require 'spec_helper'

describe Practice do
  before(:each) do
    @user = FactoryGirl.create :user
    @word1 = FactoryGirl.create :hiragana_word, user: @user
    @word2 = FactoryGirl.create :kanji_word, user: @user
    @word3 = FactoryGirl.create :katakana_word, user: @user
  end

  context 'with empty params hash' do
    it 'should generate a practice word grid' do

      p = Practice.new @user.id
      pg = p.generate

      expect(pg).to be_an(Array)
      expect(pg.length).to eq 3
      expect(pg).to include([@word1.english, @word1.hiragana])
      expect(pg).to include([@word2.english, @word2.hiragana, @word2.kanji])
      expect(pg).to include([@word3.english, @word3.katakana])
    end
  end
end