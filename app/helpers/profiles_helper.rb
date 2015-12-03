module ProfilesHelper
  def cache_key_for_profile_summary(profile)
    "profile_sum-#{profile.id}-#{profile.updated_at}-#{profile.user.following.count}-#{profile.user.followers.count}"
  end

  def cache_key_for_profile_mood_page(user)
    "profile_update_page-#{user.id}-#{user.mood_update.maximum(:updated_at)}-#{Mood.maximum(:updated_at)}-#{Comment.maximum(:updated_at)}"
  end  

  def cache_key_for_profile_mood_chart(user)
    "profile_update_chart-#{user.id}-#{user.mood_update.maximum(:updated_at)}"
  end

  def cache_key_for_profile_update_row(update)
    "profile_update_row-#{update.id}-#{update.updated_at}-#{update.mood.updated_at}-#{update.comment.maximum(:updated_at)}"
  end

  def cache_key_for_profile_mood(user)
    "profile_moods-#{user.id}-#{user.mood.maximum(:updated_at)}"
  end
end
