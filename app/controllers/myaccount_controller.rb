class MyaccountController < ApplicationController
  layout "member"

  def index
    if !@member
      redirect_to login_url
    end
  end

end