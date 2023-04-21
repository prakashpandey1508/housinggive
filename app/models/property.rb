class Property < ApplicationRecord
  belongs_to :agent
  has_many_attached :images
  has_many :comments, as: :commentable ,dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments
  has_many :agents, through: :appointments 
  belongs_to :propertytype
  validates :name, presence:true, length: 5..100
  validates :address ,presence:true
  validates :descripition, length: 5..100, presence:true
  validates :price ,presence:true
  validates :propertytype_id, presence:true
  scope :with_property_name_contains, ->(app) { joins(:property).where("properties.name LIKE ?", "%#{app}%") }
  

end
