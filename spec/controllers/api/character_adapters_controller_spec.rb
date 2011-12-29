require 'spec_helper'

describe Api::CharacterAdaptersController do
  it "should return json for one" do
    character_adapter = CharacterAdapter.first
    get :show, id: character_adapter.id, format: :json
    response.should be_success
    json = JSON.parse(response.body)

    json['rivalry_id'].should == character_adapter.rivalry_id
    json['character_name'].should == character_adapter.character_name
    json['character_slug'].should == character_adapter.character_slug
    json['character_youtube_id'].should == character_adapter.character_youtube_id
    json['character_image_url'].should == character_adapter.character_image_url
  end

  it "should return json for all" do
    get :index, format: :json
    response.should be_success
  end
end
