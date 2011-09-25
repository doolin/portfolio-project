require 'spec_helper'

describe PagesController do

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
  end

  describe "GET 'disclaimer'" do
    it "should be successful" do
      get 'disclaimer'
      response.should be_success
    end
  end

  describe "GET 'disclosure'" do
    it "should be successful" do
      get 'disclosure'
      response.should be_success
    end
  end

  describe "GET 'terms'" do
    it "should be successful" do
      get 'terms'
      response.should be_success
    end
  end

  describe "GET 'confirmation'" do
    it "should be successful" do
      get 'confirmation'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'privacy'" do
    it "should be successful" do
      get 'privacy'
      response.should be_success
    end
  end

end
