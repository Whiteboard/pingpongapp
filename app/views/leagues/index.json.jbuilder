json.array!(@leagues) do |league|
  json.extract! league, :id, :league_name, :league_id, :league_password
  json.url league_url(league, format: :json)
end
