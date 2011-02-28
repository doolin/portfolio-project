class ProfilesController < ApplicationController

  before_filter :authenticate_member!, :except => [:show, :index]
      
  def index
    @profiles = Profile.find(:all)
  end
  
  def new
    @profile = Profile.new
    @firstname = Member.find(current_member.id).firstname
  end
  
  def create
    @profile = current_member.build_profile(params[:profile])
    if @profile.save
      redirect_to(@profile, :notice => 'Profile was successfully created.')
    end
  end
  
  def show
    @profile = Profile.find_by_url(params[:id])
    @member = Member.find(@profile.member_id)
  end
  
  def edit
    @profile = Profile.find_by_url(params[:id])
  end
  
  def update
    @profile = Profile.find_by_url(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(@profile, :notice => 'Profile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy  
  end

  # FIXME: Make a macro or something to remove ugliness from view.
  def number_of_projects(id)
    Member.find(id).projects.count
  end
  
  #:private
  
#  def firstname
#    current_member.firstname
#  end
end