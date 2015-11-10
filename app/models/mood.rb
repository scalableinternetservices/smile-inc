class Mood < ActiveRecord::Base
  belongs_to :user
  has_many :mood_update
  validates :mood, :color, presence: true
end
