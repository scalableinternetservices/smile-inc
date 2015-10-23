class AddUserToMoodUpdate < ActiveRecord::Migration
  def change
    add_reference :mood_updates, :user, index: true, foreign_key: true
  end
end
