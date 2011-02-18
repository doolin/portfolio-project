class ProfilesController < ApplicationController

  before_filter :authenticate_member!, :except => [:show, :index]
      
  def index
    redirect_to 'profile/show'
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
  
  def show
    # Use find_by_url in the future...
    @profile = Profile.find(params[:id])
    @firstname = Member.find(current_member.id).firstname
    @member = Member.find(current_member.id)
  end
  
  def edit
    # Use find_by_url in the future...
    @profile = Profile.find(params[:id])
  end
  
  def update
    @profile = Profile.find(params[:id])

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
  
  def firstname
    current_member.firstname
  end
end