class Feedback
  include Mongoid::Document
  validates :name,
            :text,
            :presence => true

  field :name, type: String
  field :text, type: String
end
