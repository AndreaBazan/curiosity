class CreatePlaySessions < ActiveRecord::Migration[5.2]
  def change
    create_table :play_sessions do |t|
      t.string :status
      t.references :user, foreign_key: true
      t.integer :last_score
      t.integer :best_score

      t.timestamps
    end
  end
end
