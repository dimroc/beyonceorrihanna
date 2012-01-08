require 'spec_helper'

describe CharacterAdapter do
  describe "#to_json" do
    let(:character_adapter) { Factory(:character_adapter) }
    it "should have json where the keys are properly prefixed" do
      json = JSON.parse(character_adapter.to_json)

      json['rivalry_id'].should == character_adapter.rivalry_id
      json['character_name'].should == character_adapter.character_name
      json['character_slug'].should == character_adapter.character_slug
      json['character_youtube_id'].should == character_adapter.character_youtube_id
      json['character_image_url'].should == character_adapter.character_image_url
    end
  end
end
