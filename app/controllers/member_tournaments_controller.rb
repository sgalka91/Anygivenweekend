class MemberTournamentsController < ApplicationController

def register
  @member_tournament  = MemberTournament.new
  @tournament = Tournament.find(params[:tournamentId])
end

end
