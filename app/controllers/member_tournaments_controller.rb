class MemberTournamentsController < ApplicationController

def new
  @member_tournament  = MemberTournament.new
  @tournament = Tournament.find(params[:tournamentId])
end

end
