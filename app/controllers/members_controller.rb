class MembersController < ApplicationController

  # I don't like this, it smells...
  def show
    if member_signed_in?
      @member   = Member.find(current_member.id)
    else
      @member   = Member.find(params[:id])
    end
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
