class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :teamname
      t.string :city
      t.integer :sport_id
      t.integer :fan_id
      t.timestamps
    end
  end
end
