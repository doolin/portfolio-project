class MembersController < ApplicationController
  
  def show
    @member = Member.find(params[:id])
    @projects = @member.projects
    @profile = @member.profile
  end
  
  def index
    #@member = Member.find(params[:id])
    @members = Member.find(:all)
  end
    
end