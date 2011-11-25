require 'spec_helper'

describe Character do
  it "user can see the list of characters" do
    visit characters_path
    Character.find_each do |character|
      page.should have_content character.name
    end
  end

  it "user can see a character" do
    character = Character.where("image_url is not null AND image_url != ''").sample
    visit character_path character
    page.should have_content character.name
    page.should have_content character.caption
    page.should have_css "img[src*='#{character.image_url}']"
  end
end
