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
      rendered.should have_selector('th', :content => 'Name')
      rendered.should have_selector('th', :content => 'Summary')
      rendered.should have_selector('th', :content => 'Tags')
    end
     
  end
  
end
