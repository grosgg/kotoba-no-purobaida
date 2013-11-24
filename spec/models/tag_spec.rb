require 'spec_helper'

describe Tag do
  it { should have_field(:name).of_type(String) }
  it { should have_field(:count).of_type(Integer).with_default_value_of(0) }
  it { should validate_presence_of(:name) }
  it { should belong_to(:user)}
end