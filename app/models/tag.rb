class Tag
  include Mongoid::Document
  field :name, type: String
  field :count, type: Integer, default: 0
  belongs_to :user
  validates_presence_of :name

end
