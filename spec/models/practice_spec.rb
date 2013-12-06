require 'spec_helper'

describe Practice do
  before(:each) do
    @user = FactoryGirl.create :user
    @word1 = FactoryGirl.create :word, user: @user
    @word2 = FactoryGirl.create :word, user: @user
  end

  context 'with empty params hash' do
    it 'should generate a practice word grid' do

      @practice = Practice.new @user.id
      pg = @practice.generate

      pg.should be_an(Array)
      pg.length.should == 2
      pg[0][0].should == @word1.english
      pg[1][2].should == @word2.kanji
    end
  end
end