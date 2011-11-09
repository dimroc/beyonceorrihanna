require 'spec_helper'

describe Admin::CharactersController do
  describe "When logged in" do
    before { controller_sign_in }
    describe "GET /index" do
      it "should render success" do
        get :index
        response.should be_success
      end

      it "should return all characters" do
        get :index
        assigns(:characters).should eq(Character.all)
      end
    end
  end
end
