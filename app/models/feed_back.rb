class FeedBack
  include Mongoid::Document

  field :name, type: String
  field :email, type: String
  field :text, type: String
end
