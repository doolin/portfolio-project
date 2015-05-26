require 'spec_helper'

describe "LayoutLinks" do
  it "should have a Contact page at '/contact'" do
    get '/contact'
    expect(response).to render_template(:contact)
  end

  it "should have an About page at '/about'" do
    get '/about'
    expect(response).to render_template(:about)
  end

  it "should have a Disclaimer page at '/disclaimer'" do
    get '/disclaimer'
    expect(response).to render_template(:disclaimer)
  end

  it "should have a Disclosure page at '/disclosure'" do
    get '/disclosure'
    expect(response).to render_template(:disclosure)
  end

  it "should have a Privacy page at '/privacy'" do
    get '/privacy'
    expect(response).to render_template(:privacy)
  end

  it "should have a Terms & Conditions page at '/terms'" do
    get '/terms'
    expect(response).to render_template(:terms)
  end

  it "should have a Help page at '/help'" do
    get '/help'
    expect(response).to render_template(:help)
  end
end
