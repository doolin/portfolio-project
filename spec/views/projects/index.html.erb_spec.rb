require 'spec_helper'

describe "projects/index.html.erb" do
   
  context "with 2 projects" do
    before(:each) do
      assign(:projects, [
        stub_model(Project, :name => "slicer", :member => Factory(:member))
        #stub_model(Project, :name => "dicer", :member => @member)
      ])
    end
    
    it "renders a list of projects" do
      pending "Not getting this at all right now."
      render
      # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
      assert_select "tr>td", :text => "Name".to_s, :count => 2
      # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
      #assert_select "tr>td", :text => "Summary".to_s, :count => 2
      # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
      #assert_select "tr>td", :text => "Client".to_s, :count => 2
    end
    
  end
end
