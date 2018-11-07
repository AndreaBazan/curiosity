class AddScoreAndLastPlayToPlaySessions < ActiveRecord::Migration[5.2]
  def change
    add_column :play_sessions, :score, :integer
    add_column :play_sessions, :last_play, :text
  end
end
