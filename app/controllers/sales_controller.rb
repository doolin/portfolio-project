class SalesController < ApplicationController

  def index
    @projects = Project.find(:all)
    @profiles = Profile.find(:all)
  end
  
  # Add more pages as necessary, but only when necessary.
end
