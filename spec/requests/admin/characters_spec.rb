require 'spec_helper'

describe Character, js: true do
  before { sign_in_as_admin }
  describe 'ADMIN GET /index' do
    it "should return success" do
      visit admin_characters_path
      current_path.should == admin_characters_path
    end

    it "should list all characters" do
      visit admin_characters_path
      within "section.characters" do
        Character.find_each do |c|
          page.should have_content c.name
        end
      end
    end
  end

  describe 'USER GET /index' do
    before { sign_out }
    it "should return failure" do
      visit admin_characters_path
      current_path.should == sign_in_path
    end
    it "should return failure for non-admin users" do
      sign_in
      visit admin_characters_path
      current_path.should == root_path
    end
  end

  describe "Admin /new creates character" do
    let(:character) { Factory.build(:character) }
    after { character.destroy }
    it "should create the character with a few empty fields" do
      visit new_admin_character_path
      fill_in "Name", with: character.name
      fill_in "Caption", with: character.caption
      click_on "Create"

      visit admin_characters_path
      page.should have_content character.name
    end
    it "should create the character" do
      visit new_admin_character_path
      fill_in "Name", with: character.name
      fill_in "Caption", with: character.caption
      fill_in "Image url", with: character.image_url
      fill_in "Youtube", with: character.youtube_id
      fill_in "Twitter tags", with: character.twitter_tags
      click_on "Create"

      visit admin_characters_path
      page.should have_content character.name
      Character.find_by_name(character.name).should_not be_nil
    end
  end

  describe "ADMIN edits character" do
    let(:character) { Character.first }
    let(:changed_character) { Factory.build(:character) }
    it "should allow editing the fields" do
      visit edit_admin_character_path(character)
      fill_in "character_name", with: changed_character.name
      fill_in "character_caption", with: changed_character.caption
      fill_in "character_image_url", with: changed_character.image_url
      fill_in "character_youtube_id", with: changed_character.youtube_id
      fill_in "Twitter tags", with: changed_character.twitter_tags
      click_button "Update Character"

      character.reload
      character.name.should == changed_character.name
      character.twitter_tag_list == changed_character.twitter_tag_list
      visit character_path character
      page.should have_content changed_character.name
      page.should have_content changed_character.caption
      page.should have_css "img[src*='#{changed_character.image_url}']"
    end
  end
end
