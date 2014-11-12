require 'spec_helper'

describe Guess do
  before(:each) do
    @user = FactoryGirl.create :user
    @word1 = FactoryGirl.create :hiragana_word, user: @user
    @word2 = FactoryGirl.create :kanji_word, user: @user
    @word3 = FactoryGirl.create :katakana_word, user: @user
  end

  context 'with empty params hash' do
    before(:each) do
      @t = Guess.new @user.id
    end

    it 'should initialize' do
      expect(@t.from).to eq 'english'
      expect(@t.to).to eq 'hiragana'
    end

    it 'should generate a hiragana guess word grid by default' do
      pg = @t.generate

      expect(pg).to be_an(Array)
      expect(pg.length).to eq 1
      expect(pg).to include([@word1.english, @word1.hiragana])
    end
  end

  context 'with katakana to english params hash' do
    before(:each) do
      @t = Guess.new @user.id, {
        from: 'katakana',
        to: 'english'
      }
    end

    it 'should initialize' do
      expect(@t.from).to eq 'katakana'
      expect(@t.to).to eq 'english'
    end

    it 'should generate a custom guess word grid' do
      pg = @t.generate

      expect(pg).to be_an(Array)
      expect(pg.length).to eq 1
      expect(pg).to include([@word3.katakana, @word3.english])
    end
  end

  context 'with french to kanji params hash' do
    before(:each) do
      @t = Guess.new @user.id, {
        from: 'french',
        to: 'kanji'
      }
    end

    it 'should initialize' do
      expect(@t.from).to eq 'french'
      expect(@t.to).to eq 'kanji'
    end

    it 'should generate a custom guess word grid' do
      pg = @t.generate

      expect(pg).to be_an(Array)
      expect(pg.length).to eq 1
      expect(pg).to include([@word2.french, @word2.kanji])
    end
  end
end