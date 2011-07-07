
require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should render_template(:contact)
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should render_template(:about)
  end

  it "should have a Disclaimer page at '/disclaimer'" do
    #pending "Add this link later"
    get '/disclaimer'
    response.should render_template(:disclaimer)
  end

  it "should have a Disclosure page at '/disclosure'" do
    #pending "Add this link later"
    get '/disclosure'
    response.should render_template(:disclosure)
  end

  it "should have a Privacy page at '/privacy'" do
    get '/privacy'
    response.should render_template(:privacy)
  end

  it "should have a Terms & Conditions page at '/terms'" do
    get '/terms'
    response.should render_template(:terms)
  end

  it "should have a Help page at '/help'" do
    #pending "Develop a help system"
    get '/help'
    response.should render_template(:help)
  end
end
