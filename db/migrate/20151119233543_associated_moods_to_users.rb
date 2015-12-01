class AssociatedMoodsToUsers < ActiveRecord::Migration
  using(:moodshard)
  
  def change
    add_column :mood_updates, :user_id, :string
    add_column :moods, :user_id, :string
  end
end
