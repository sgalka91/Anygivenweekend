class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :getMember

  def getMember
  if session[:currentMemberId]
    @member = Member.find(session[:currentMemberId])
  else
    @member = nil
  end

  end

end
