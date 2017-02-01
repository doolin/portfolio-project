# frozen_string_literal: true
class MembersController < ApplicationController
  # I don't like this, it smells...
  def show
    @member = if member_signed_in?
                Member.find(current_member.id)
              else
                Member.find(params[:id])
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
