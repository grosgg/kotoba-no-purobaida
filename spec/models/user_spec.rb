require 'spec_helper'

describe User do
  it { should have_field(:name).of_type(String) }
  it { should validate_presence_of(:name) }
end