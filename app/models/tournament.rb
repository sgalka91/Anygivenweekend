class Tournament < ActiveRecord::Base
  has_many :member_tournaments, :foreign_key => 'tournamentId', :primary_key => 'tournamentid' #The members registered to this tournament
    
end