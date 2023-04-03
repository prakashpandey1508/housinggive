class Property < ApplicationRecord
  belongs_to :agent
  has_many_attached :images
  has_many :comments, as: :commentable
  
end
