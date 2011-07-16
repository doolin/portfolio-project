class MembersController < ApplicationController
  
  def show
    @member   = Member.find(params[:id])
    @projects = @member.projects
    @profile  = @member.profile
  end
  
  def index
    if member_signed_in?
      redirect_to profiles_path
    else
      redirect_to new_member_session_path
    end
  end
    
end