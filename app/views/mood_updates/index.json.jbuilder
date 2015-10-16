json.array!(@mood_updates) do |mood_update|
  json.extract! mood_update, :id, :mood_id, :desc, :intensity
  json.url mood_update_url(mood_update, format: :json)
end
