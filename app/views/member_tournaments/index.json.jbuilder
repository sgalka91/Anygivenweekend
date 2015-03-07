json.array!(@member_tournaments) do |member_tournament|
  json.extract! member_tournament, :id, :\, :memberId, :tournamentId
  json.url member_tournament_url(member_tournament, format: :json)
end
