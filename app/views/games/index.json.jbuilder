json.array!(@games) do |game|
  json.extract! game, :id, :home_id, :home_score, :away_id, :away_score, :match_id
  json.url game_url(game, format: :json)
end
