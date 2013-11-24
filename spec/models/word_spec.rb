require 'spec_helper'

describe Word do
  it { should have_field(:english).of_type(String) }
  it { should have_field(:french).of_type(String) }
  it { should have_field(:hiragana).of_type(String) }
  it { should have_field(:katakana).of_type(String) }
  it { should have_field(:kanji).of_type(String) }
  it { should validate_presence_of(:english) }
  it { should belong_to(:user)}
end