json.array!(@mood_updates) do |mood_update|
  json.extract! mood_update, :id, :desc, :intensity, :mood_id, :user_id
  json.url mood_update_url(mood_update, format: :json)
end
