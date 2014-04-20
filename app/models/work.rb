class Work
  include Mongoid::Document
  validates :from,
            :name,
            :profession,
            :occupation,
            :presence => true

  field :from, type: DateTime
  field :to, type: DateTime
  field :name, type: String
  field :profession, type: String
  field :occupation, type: String

  embedded_in :my_self
end
