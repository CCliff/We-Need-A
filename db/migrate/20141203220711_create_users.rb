class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :hashed_password
      t.string :sports
      t.string :locations

      t.timestamps
    end
  end
end
