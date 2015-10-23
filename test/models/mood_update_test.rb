require 'test_helper'

class MoodUpdateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  
  fixtures :moods
  fixtures :users

  #Test user submission of new mood
  test "mood updates must have mood and intensity" do
    update = MoodUpdate.new
    assert update.invalid?
    assert update.errors[:mood].any?
    assert update.errors[:intensity].any?
  end

  #Test "intensity must be between 0 and 10" do
  test "intensity must be between 0 and 10" do
    update = MoodUpdate.new(intensity: 0,
			    mood:      moods(:joy),
			    desc:      "")
    assert update.invalid?
    assert update.errors[:intensity].any?
    update.intensity = 11
    assert update.invalid?
    assert update.errors[:intensity].any?
    update.intensity = 10
    assert update.valid?
  end

end
