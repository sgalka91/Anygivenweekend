class TournamentsController < ApplicationController
  layout 'member'

  before_action :checkloggedIn, only: :new

  def new
    @tournament = Tournament.new
  end

  def checkloggedIn
    if !@member
      redirect_to login_url
    end
  end

  def index
    @tournaments = Tournament.all
  render :layout => 'application'
  end

  def create
    @tournament = Tournament.new(params[:tournament].permit(:title, :lake, :fee, :numBoats, :hasCoAnglers, :contactPhone, :startDate, :address, :city, :state, :zip))
    #Get lat lng from GMaps
    if @tournament.save

      memberTournamnet = MemberTournament.new
      memberTournamnet.tournamentId = @tournament.tournamentId
      memberTournamnet.memberId = @member.memberId
      memberTournamnet.isOwner = 1
      memberTournamnet.isApproved = 1
      memberTournamnet.contactEmail = @member.Email
      memberTournamnet.contactPhone = @member.Phone
      memberTournamnet.save

      

      redirect_to('/my-account/', :notice => 'Tournament was successfully created.')
    else
      render :action => 'new'
    end
  end

end