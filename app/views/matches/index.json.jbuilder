json.array!(@matches) do |match|
  json.extract! match, :id, :player_one, :player_two
  json.url match_url(match, format: :json)
end
