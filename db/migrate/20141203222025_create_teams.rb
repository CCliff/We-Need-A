class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :user
      t.string :teamName
      t.string :sport

      t.timestamps
    end
  end
end
