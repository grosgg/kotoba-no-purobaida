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
      @t.from.should == 'english'
      @t.to.should == 'hiragana'
    end

    it 'should generate a hiragana guess word grid by default' do
      pg = @t.generate

      pg.should be_an(Array)
      pg.length.should == 1
      pg.should include([@word1.english, @word1.hiragana])
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
      @t.from.should == 'katakana'
      @t.to.should == 'english'
    end

    it 'should generate a custom guess word grid' do
      pg = @t.generate

      pg.should be_an(Array)
      pg.length.should == 1
      pg.should include([@word3.katakana, @word3.english])
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
      @t.from.should == 'french'
      @t.to.should == 'kanji'
    end

    it 'should generate a custom guess word grid' do
      pg = @t.generate

      pg.should be_an(Array)
      pg.length.should == 1
      pg.should include([@word2.french, @word2.kanji])
    end
  end
end