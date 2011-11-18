require 'spec_helper'

describe Character do
  it "user can see the list of characters" do
    visit characters_path
    Character.find_each do |character|
      page.should have_content character.name
    end
  end

  it "user can see a character" do
    character = Character.all.sample
    visit character_path character
    page.should have_content character.name
  end
end