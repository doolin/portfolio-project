require 'spec_helper'

describe SalesController do
  describe "GET 'sales/index'" do
    it "should be successful" do
      get :index
      expect(response).to be_success
    end
  end
end
