
require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Portfolio Project")
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    #response.should have_selector('title', :content => "Contact")
    response.should have_selector('h2', :content => "Contact")
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end

  it "should have a Disclaimer page at '/disclaimer'" do
    pending "Add this link later"
    get '/disclaimer'
    response.should have_selector('title', :content => "Discplaimer")
  end

  it "should have a Disclosure page at '/disclosure'" do
    pending "Add this link later"
    get '/disclosure'
    response.should have_selector('title', :content => "Disclosure")
  end

  it "should have a Privacy page at '/privacy'" do
    get '/privacy'
    #response.should have_selector('title', :content => "Privacy")
    response.should have_selector('h2', :content => "Privacy")
  end

  it "should have a Terms & Conditions page at '/terms'" do
    get '/terms'
    #response.should have_selector('title', :content => "Terms & Conditions")
    response.should have_selector('h2', :content => "Terms & Conditions")
  end

  it "should have a Help page at '/help'" do
    pending "Develop a help system"
    get '/help'
    response.should have_selector('title', :content => "Help")
  end
end
