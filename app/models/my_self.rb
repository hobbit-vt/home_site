class MySelf
  include Mongoid::Document
  validates :name,
            :city,
            :date_birth,
            :email,
            :phone,
            :vk,
            :presence => true

  validate :array_not_nil

  field :name, type: String
  field :city, type: String
  field :date_birth, type: DateTime
  field :technologies, type: Array, default: []
  field :interests, type: Array, default: []
  field :email, type: String
  field :phone, type: String
  field :vk, type: String

  embeds_many :works
  embeds_many :studies

  private

  def array_not_nil
    errors.add(:technologies, 'nil') if technologies.nil?
    errors.add(:interests, 'nil') if interests.nil?
    errors.add(:works, 'nil') if works.nil?
    errors.add(:studies, 'nil') if studies.nil?
  end
end
