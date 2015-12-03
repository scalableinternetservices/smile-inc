class AddIndexMoodUpdateIdToComments < ActiveRecord::Migration
  def change
  	add_index :mood_updates, :user_id
  	add_index :profiles, :user_id
  end
end
