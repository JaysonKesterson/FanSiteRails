class FanTeam < ApplicationRecord
    belongs_to :fan
    belongs_to :team
    validates :team_id, uniqueness: { scope: :fan_id, message: "You are already a fan of this team." }
end
