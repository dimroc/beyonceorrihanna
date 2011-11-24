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
    it "should create the character" do
      visit new_admin_character_path
      fill_in "Name", with: character.name
      fill_in "Caption", with: character.caption
      click_on "Create"

      visit admin_characters_path
      page.should have_content character.name
    end
  end

  describe "ADMIN edits character" do
    let(:character) { Character.first }
    let(:changed_name) { Faker::Name.first_name }
    let(:changed_caption) { Faker::Lorem.sentence }
    it "should allow editing the fields" do
      visit edit_admin_character_path(character)
      fill_in "character_name", with: changed_name
      fill_in "character_caption", with: changed_caption
      click_button "Update Character"

      character.reload
      character.name.should == changed_name
      visit character_path character
      page.should have_content changed_name
      page.should have_content changed_caption
    end
  end
end
