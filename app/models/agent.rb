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
  #has_many :properties, through: :appointments
  validates :name, presence: true
  validates :address, length: { maximum: 20 }
  validate :password_format
  validates :email ,uniqueness: {message: ': An account associated with %{value} already exists'}



   #agent doorkeeper authorization
  def self.authenticate(email, password)

    agent=Agent.find_for_authentication(email: email)
    agent&.valid_password?(password) ? agent : nil
  end

  def password_format
    unless password.match?(/^(?=.*[A-Z])(?=.*\d).+$/)
      errors.add :password, 'must contain at least one uppercase letter and one digit'
    end
  end
end
