class CreateFanTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :fan_teams do |t|
      t.integer :fan_id
      t.integer :team_id
      t.boolean :die_hard_fan
      t.timestamps
    end
  end
end
