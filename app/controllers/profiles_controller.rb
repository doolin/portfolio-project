class ProfilesController < ApplicationController

  before_filter :authenticate_member!, :except => [:show, :index]

  def index
    @profiles = Profile.all
  end

  def new
=begin
  if current_member.has_profile?
    redirect_to edit_profile_path
  else # new profile
=end

    @profile = Profile.new
    # TODO: Get rid of firstname in Member, it's
    # a bad model.
    @firstname = Member.find(current_member.id).firstname
  end

  def create
    @profile = current_member.build_profile(profile_params)
    if @profile.save
      # TODO: Refactor and test, should go into model
      @member = Member.find(@profile.member_id)
      @member.firstname = @profile.firstname
      @member.lastname = @profile.lastname
      @member.save!
      # puts @profile.inspect
      puts @member.profile.inspect
      # redirect_to(@profile, id: @profile.id, :flash => { :success => 'Profile was successfully created.' })
      redirect_to(id: @profile.id, :flash => { :success => 'Profile was successfully created.' })
      # format.html { redirect_to profile_path(@profile.id), status: 'foo bar' } # :flash => { :success => 'Profile was successfully created.' } }

      # format.html { redirect_to travel_cost_path(@travel, @cost),
      #               notice: 'Cost was successfully created.' }

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
      # TODO: Refactor and test, should go into model
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
    # From cacklist...
    #redirect_back_or root_path
    redirect_to(root_path, :flash => { :success => 'Profile was successfully removed.' })
  end

  # FIXME: Make a macro or something to remove ugliness from view.
  def number_of_projects(id)
    Member.find(id).projects.count
  end

  def current_member?(id)
    current_member.id == id
  end

  private

  def profile_params
    params.permit(:id, :firstname, :lastname, :website, :firstname, :lastname, :twitter, :bio, :url,
                  :facebook, :linkedin, :website_anchor, :gprofile_url)
  end

#  def firstname
#    current_member.firstname
#  end
end
