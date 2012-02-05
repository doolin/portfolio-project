require 'spec_helper'


describe "projects/index.html.erb" do
   
  context "with 2 projects" do

    before(:each) do
      @member   = Factory(:member)
      @slicer   = Factory(:project, :name => 'Slicer', :member => @member)
      @dicer    = Factory(:project, :name => 'Dicer',  :member => @member)
      @projects = Project.find(:all)
      sign_in @member
    end

    
    it "renders a list of projects" do
      render
      # http://groups.google.com/group/ruby-capybara/browse_thread/thread/944871152dae0272/9ca6dcaf173dab74
      # http://groups.google.com/group/ruby-capybara/msg/9ca6dcaf173dab74
      rendered.should have_selector('h2.projects-listing')
      rendered.should have_selector('p.project-summary')
    end
     
  end
  
  it "should have the correct <title> element " do
    @projects = mock(Project).as_null_object
    render(:template => "projects/index.html.erb", :layout => 'layouts/application')
    # have_selector is from webrat 
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    rendered.should have_selector("title", :content => "Projects | Portfolio Project")
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    #view.content_for(:sidebar).should have_selector('div.quote')
  end
end
