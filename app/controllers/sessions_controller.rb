class SessionsController < ApplicationController

  def create
    if member = Member.authenticate(params[:Email], params[:password])
      session[:currentMemberId] = member.memberId

      redir = login_url

      if session[:redir]
        redir = session[:redir]
        session[:redir] = nil
      end

        redirect_to redir

    else
      redirect_to login_url, :alert => 'Invalid email/password combination'
    end
  end

  def new
    if @member
      redirect_to '/my-account'
    end

    session[:redir] = params[:redir]

  end

  def destroy
    session[:currentMemberId] = nil
    redirect_to "/", :notice => "logged out"
  end
end