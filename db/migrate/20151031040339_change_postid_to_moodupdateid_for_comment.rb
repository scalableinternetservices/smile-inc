class ChangePostidToMoodupdateidForComment < ActiveRecord::Migration
  def change
    remove_column :comments, :post_id, :integer
    add_column :comments, :mood_update_id, :integer
  end
end
