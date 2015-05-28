class ProfilesController < ApplicationController

  before_filter :authenticate_member!, :except => [:show, :index]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
    @firstname = Member.find(current_member.id).firstname
  end

  def create
    @profile = current_member.build_profile(profile_params)
    if @profile.save!
      @member = Member.find(@profile.member_id)
      @member.firstname = @profile.firstname
      @member.lastname = @profile.lastname
      @member.save!
      redirect_to(@profile, :flash => { :success => 'Profile was successfully created.' })
    end
  end

  def show
    @profile = Profile.find_by_url(params[:id])
    @member = Member.find(@profile.member_id)
    @projects = @member.projects
  end

  def edit
    @profile = Profile.find_by_url(params[:id])
  end

  def update
    @profile = Profile.find_by_url(params[:id])

    respond_to do |format|
      if @profile.update_attributes(profile_params)
        @member = Member.find(@profile.member_id)
        @member.firstname = @profile.firstname
        @member.lastname = @profile.lastname
        @member.save
        format.html { redirect_to(@profile, :flash => { :success => 'Profile was successfully updated.' }) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile = Profile.find_by_url(params[:id])
    @profile.destroy
    redirect_to(root_path, :flash => { :success => 'Profile was successfully removed.' })
  end

  def number_of_projects(id)
    Member.find(id).projects.count
  end

  def current_member?(id)
    current_member.id == id
  end

  private

  def profile_params
    params.permit(:id, :firstname, :lastname, :website, :twitter, :bio, :url,
                  :facebook, :linkedin, :website_anchor, :gprofile_url)
  end
end
