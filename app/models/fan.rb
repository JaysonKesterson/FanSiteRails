class Fan < ApplicationRecord
    has_secure_password
    has_many :sports, through: :teams
    has_many :teams
end
