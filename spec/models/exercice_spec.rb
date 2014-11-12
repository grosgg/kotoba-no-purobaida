require 'spec_helper'

describe Exercice do
  it 'should include ActiveModel::Validations' do
    expect(Exercice).to include(ActiveModel::Validations)
  end

  context 'with no params provided' do
    it 'should not initialize' do
      expect { Exercice.new }.to raise_error
    end
  end

  context 'with at least user_id provided' do
    let(:user) { FactoryGirl.create :user }

    it 'should initialize' do
      expect { Exercice.new(user.id) }.not_to raise_error
    end
  end

  context 'when succesfull created' do
    let(:user) { FactoryGirl.create :user }
    let(:exercice) { Exercice.new user.id }

    it 'should respond to :tags' do
      expect(exercice).to respond_to :tags
    end
    it 'should respond to :is_or' do
      expect(exercice).to respond_to :is_or
    end
    it 'should respond to :pages' do
      expect(exercice).to respond_to :pages
    end
  end
end