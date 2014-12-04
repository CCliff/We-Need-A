class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :user
      t.references :game

      t.timestamps
    end
  end
end
