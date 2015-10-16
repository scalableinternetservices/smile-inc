class MoodUpdate < ActiveRecord::Base
  belongs_to :mood
  validates :mood, :intensity, presence: true
  validates :intensity, numericality: {only_integer:true, greater_than: 0, less_than_or_equal_to: 10}
end
