class Mood < ActiveRecord::Base
  validates :mood, :color, presence: true
end
