class RenameTeamMatchToScore < ActiveRecord::Migration[5.1]
  def change
    rename_table :team_matches, :scores
  end
end
