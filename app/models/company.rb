class Company < ApplicationRecord
    has_many :agents, dependent: :destroy
end
