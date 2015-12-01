class CreateMoodUpdates < ActiveRecord::Migration
using( :moodshard)
  def change
    create_table :mood_updates, :force => true do |t|
      t.references :mood, index: true, foreign_key: true
      t.string :desc
      t.integer :intensity

      t.timestamps null: false
    end
  end
end
