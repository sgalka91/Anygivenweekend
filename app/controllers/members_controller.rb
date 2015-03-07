class MembersController < ApplicationController
    layout "application"
    def create
       @member = Member.new(params[:member].permit(:Email, :FirstName, :password, :password_confirmation, :LastName, :Address1, :Address2, :City, :State, :Zip))
       @member.IsActive = 1
        if @member.save
            redirect_to(members_url, :notice => "Member #{@member.Email} was successfully created.")
        else
            render :action => "new"
        end
    end
    
    def new
        if @member
          redirect_to '/my-account/'
        else
          @member = Member.new
        end

    end
    
end
    