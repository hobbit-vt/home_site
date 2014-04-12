class MySelf
  include Mongoid::Document

  field :name, type: String
  field :city, type: String
  field :date_birth, type: DateTime
  field :technologies, type: Array
  field :interests, type: Array
  field :email, type: String
  field :phone, type: String
  field :vk, type: String

  embeds_many :works
  embeds_many :studies
end
