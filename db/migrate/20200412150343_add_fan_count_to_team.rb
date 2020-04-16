class AddFanCountToTeam < ActiveRecord::Migration[6.0]
  def change
    add_column(:teams, :fancount, :integer)
  end
end
