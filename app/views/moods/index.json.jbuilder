json.array!(@moods) do |mood|
  json.extract! mood, :id, :color, :mood
  json.url mood_url(mood, format: :json)
end
