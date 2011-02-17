class ProfilesController < ApplicationController
  
  def index
  end
  
  def new
  end
  
  def create
    @profile = current_member.profiles.build(params[:profile])
  end
  
  def show
    # Use find_by_url in the future...
    @profile = Profile.find(params[:id])
  end
  
  def edit
    # Use find_by_url in the future...
    @profile = Profile.find(params[:id])
  end
  
  def update 
  end
  
  def destroy  
  end
  
end