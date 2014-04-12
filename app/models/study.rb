class Study
  include Mongoid::Document

  field :from, type: DateTime
  field :to, type: DateTime
  field :name, type: String
  field :desc, type: String

  embedded_in :my_self
end
