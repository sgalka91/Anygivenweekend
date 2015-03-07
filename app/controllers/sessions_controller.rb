class SessionsController < ApplicationController

  def create
    if member = Member.authenticate(params[:Email], params[:password])
      session[:currentMemberId] = member.memberId
      redirect_to '/my-account/'
    else
      redirect_to login_url, :alert => 'Invalid email/password combination'
    end
  end

  def new
    if @member
      redirect_to '/my-account'
    end

  end

  def destroy
    session[:currentMemberId] = nil
    redirect_to "/", :notice => "logged out"
  end
end