class AddUniqueIndexesForTeamTournaments < ActiveRecord::Migration[5.0]

  def change
    add_index :team_tournaments, [:team_id, :tournament_id], unique: true
  end

end
