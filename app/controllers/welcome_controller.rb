class WelcomeController < ApplicationController
    layout "application"
    
    before_action :get_tournaments
    
    def index


    end
    
    
    def get_tournaments
       @tournaments = Tournament.all 
    end
    
    def addContactSubmission
        
    end
    
end