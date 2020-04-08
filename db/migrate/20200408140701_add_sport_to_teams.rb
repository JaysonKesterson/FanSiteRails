class AddSportToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column(:teams, :sport, :string)
  end
end
