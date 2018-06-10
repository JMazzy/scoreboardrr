class AddScoreTypeToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :score_type, :integer, default: 0, null: false
  end
end
