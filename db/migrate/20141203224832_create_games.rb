class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :team
      t.date :date
      t.string :location
      t.string :needs

      t.timestamps
    end
  end
end
