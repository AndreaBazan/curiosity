class AddBoardToLevels < ActiveRecord::Migration[5.2]
  def change
    add_column :levels, :board, :text, serialize: JSON
  end
end
