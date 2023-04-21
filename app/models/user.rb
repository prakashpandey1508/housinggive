class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :appointments
         has_many :properties , through: :appointments
         has_many :comments
         validates :name, presence: true
         validates :email, uniqueness: {message: ':this email is already exists please give another email for registration' }
        validates :email ,format: URI::MailTo::EMAIL_REGEXP

        def self.authenticate(email, password)
         # debugger
          user=User.find_for_authentication(email: email)
          user&.valid_password?(password) ? user : nil
        end

end
