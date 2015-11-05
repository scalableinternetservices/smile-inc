class Comment < ActiveRecord::Base
  belongs_to :mood_update
  belongs_to :user
end
