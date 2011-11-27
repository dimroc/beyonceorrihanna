require 'spec_helper'

describe Admin::RivalriesController do
  before { controller_sign_in }
  it "GET /index" do
    get :index
    response.should be_success
    assigns(:rivalries).should eq(Rivalry.all)
  end

  it "GET /new" do
    get :new
    response.should be_success
    assigns(:rivalry)
  end

  it "POST /create" do
    2.times { Factory (:character) }
    post :create, rivalry: { character_ids: Character.last(2).map(&:id) }
    response.should be_redirect
    assigns(:rivalry)
  end

  it "GET /show" do
    rivalry = Rivalry.all.sample
    get :show, id: rivalry.id
    response.should be_success
    assigns(:rivalry).should == rivalry
  end
end
