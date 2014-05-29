class Feedback
  include Mongoid::Document

  field :name, type: String
  field :text, type: String
end
