class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company
  has_many :properties, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments
  has_many :comments, as: :commentable
end
