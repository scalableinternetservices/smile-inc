require 'test_helper'

class MoodTest < ActiveSupport::TestCase
  test "Mood description is associated with a color" do
    mood = Mood.new
    assert mood.invalid?
    assert mood.errors[:color].any?
    assert mood.errors[:mood].any?
  end
end
