class MyaccountController < ApplicationController
  layout "member"

  def index
    if !@member
      redirect_to login_url
    end
  end


  def brags
      @myBrags = Brag.where :memberid => session[:currentMemberId]
  end

  def tournaments
    @memberTournaments = MemberTournament.where :memberId => session[:currentMemberId]
  end
end