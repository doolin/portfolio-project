class ProjectsController < ApplicationController
  
  before_filter :authenticate_member!, :except => [:show, :index]
  
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find_by_url(params[:id])

    @profile = Profile.find(@project.member_id)
    @member = Member.find(@profile.member_id)


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find_by_url(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    #@project = Project.new(params[:project])
    @project = current_member.projects.build(params[:project])
    # TODO: Remove if possible...
    flash[:success] = "New project created!"
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to(@project, :flash => { :success => 'Project was successfully created.'}) }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find_by_url(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :flash => { :success => 'Project was successfully updated.' }) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find_by_url(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url, :flash => { :success => 'Project was successfully deleted.' }) }
      format.xml  { head :ok }
    end
  end
end
