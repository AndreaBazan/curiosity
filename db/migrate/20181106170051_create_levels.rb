class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.string :board_config
      t.references :play_sessions, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
