class Tag
  include Mongoid::Document
  field :name, type: String
  field :count, type: Integer
  belongs_to :user
end
