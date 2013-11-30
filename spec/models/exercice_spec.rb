require 'spec_helper'

describe Exercice do
  context 'with no params provided' do
    it 'should not initialize' do
      expect { Exercice.new }.to raise_error
    end
  end

  context 'with at least user_id provided' do
    let(:user) { FactoryGirl.create :user }

    it 'should initialize' do
      Exercice.new(user.id).should_not raise_error
    end
  end

  context 'when succesfull created' do
    let(:user) { FactoryGirl.create :user }
    let(:exercice) { Exercice.new user.id }

    it 'should respond to :tags' do
      exercice.should respond_to :tags
    end
    it 'should respond to :is_or' do
      exercice.should respond_to :is_or
    end
    it 'should respond to :pages' do
      exercice.should respond_to :pages
    end
    it 'should respond to :type' do
      exercice.should respond_to :type
    end
  end
end