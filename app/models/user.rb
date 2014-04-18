class User
  include Mongoid::Document
  validates :name, presence: true
  validates :pass, presence: true

  field :name, type: String
  field :pass, type: String
end