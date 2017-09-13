class AddTeamTitleUniqIndex < ActiveRecord::Migration[5.0]

  def change
    add_index :teams, :title, unique: true
  end

end
