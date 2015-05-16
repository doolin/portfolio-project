require 'spec_helper'

describe PagesController do
  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      expect(response).to be_success
    end
  end

  describe "GET 'disclaimer'" do
    it "should be successful" do
      get 'disclaimer'
      expect(response).to be_success
    end
  end

  describe "GET 'disclosure'" do
    it "should be successful" do
      get 'disclosure'
      expect(response).to be_success
    end
  end

  describe "GET 'terms'" do
    it "should be successful" do
      get 'terms'
      expect(response).to be_success
    end
  end

  describe "GET 'confirmation'" do
    it "should be successful" do
      get 'confirmation'
      expect(response).to be_success
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      expect(response).to be_success
    end
  end

  describe "GET 'privacy'" do
    it "should be successful" do
      get 'privacy'
      expect(response).to be_success
    end
  end
end
