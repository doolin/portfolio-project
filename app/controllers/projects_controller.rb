class ProjectsController < ApplicationController
  before_action :authenticate_member!, except: [:show, :index]

  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @projects }
    end
  end

  def show
    @project = Project.find_by_url(params[:id])
    @member = Member.find(@project.member_id)
    @profile = @member.profile

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @project }
    end
  end

  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @project }
    end
  end

  def edit
    @project = Project.find_by_url(params[:id])
  end

  def create
    # @project = Project.new(params[:project])
    @project = current_member.projects.build(params[:project])
    # TODO: Remove if possible...
    # flash[:success] = "New project created!"

    #     respond_to do |format|
    #       if @project.save
    #         format.html { redirect_to(@project, :flash => { :success => 'Project was successfully created.'}) }
    #         format.xml  { render :xml => @project, :status => :created, :location => @project }
    #       else
    #         format.html { render :action => "new" }
    #         format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
    #       end
    #     end

    respond_to do |format|
      begin
        @project.save!
      rescue ActiveRecord::RecordNotSaved => e
        format.html do
          # Note: this flash message needs to go before the render method,
          # else the flash won't display on the next render. It will however
          # display on the render following.
          flash[:error] = "Problem: #{e.message}."
          render :new
        end
        format.xml  { render xml: @project.errors, status: :unprocessable_entity }
      # rescue Exception => e
      rescue StandardErrot => e
        format.html do
          # flash[:error] = "Problem: #{e.message}."
          render action: 'new'
        end
        format.xml  { render xml: @project.errors, status: :unprocessable_entity }
      else
        format.html { redirect_to(@project, flash: { success: 'Project was successfully created.' }) }
        format.xml  { render xml: @project, status: :created, location: @project }
      end
    end
  end

  def update
    @project = Project.find_by_url(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, flash: { success: 'Project was successfully updated.' }) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find_by_url(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url, flash: { success: 'Project was successfully deleted.' }) }
      format.xml  { head :ok }
    end
  end
end
