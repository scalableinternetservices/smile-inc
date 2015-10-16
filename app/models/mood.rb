class Mood < ActiveRecord::Base
  has_many :mood_update
  validates :mood, :color, presence: true
end
