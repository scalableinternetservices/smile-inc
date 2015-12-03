class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :mood_update, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end

    add index :comments, :mood_update_id 
  end
end
