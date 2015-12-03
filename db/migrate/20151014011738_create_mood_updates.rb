class CreateMoodUpdates < ActiveRecord::Migration
  def change
    create_table :mood_updates do |t|
      t.references :mood, foreign_key: true
      t.string :desc
      t.integer :intensity

      t.timestamps null: false
    end
  end
end
