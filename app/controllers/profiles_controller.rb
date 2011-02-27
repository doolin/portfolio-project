class ProfilesController < ApplicationController

  before_filter :authenticate_member!, :except => [:show, :index]
      
  def index
    redirect_to 'profile/show'
    #@profiles = Profile.all
  end
  
  def new
    @profile = Profile.new
    @firstname = Member.find(current_member.id).firstname
  end
  
  def create
    #@profile = Profile.new 
    #@profile = current_member.profile.build(params[:profile])
    @profile = current_member.build_profile(params[:profile])
    if @profile.save
      redirect_to(@profile, :notice => 'Profile was successfully created.')
    end
  end
  
      #@profile = Profile.find(params[:id])
    #@firstname = Member.find(current_member.id).firstname
    #@member = Member.find(current_member.id)
    # Use find_by_url in the future...

  def show
        
    #profile_id = Member.find(params[:id])

    #@profile = Profile.find_by_url(profile_id)
    @profile = Profile.find_by_url(params[:id])
    
    #@firstname = Member.find(profile_id).firstname
    
    #@member = Member.find(profile_id)
    @member = Member.find(@profile.member_id)
  end
  
  def edit
    # Use find_by_url in the future...
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

  #:private
  
#  def firstname
#    current_member.firstname
#  end
end