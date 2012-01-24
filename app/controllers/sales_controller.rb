class SalesController < ApplicationController

  def index
    if member_signed_in?
      redirect_to current_member
    else
      @projects = Project.find(:all)
      @profiles = Profile.find(:all)
    end
  end
  
  # Add more pages as necessary, but only when necessary.
end
