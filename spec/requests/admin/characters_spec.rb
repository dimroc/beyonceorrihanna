require 'spec_helper'

describe 'admin/characters', js: true do
  before { sign_in }
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
  end

  describe "Admin /new creates character" do
    let(:character) { Factory.build(:character) }
    it "should create the character" do
      visit new_admin_character_path
      fill_in "Name", with: character.name
      click_on "Create"

      visit admin_characters_path
      page.should have_content character.name
    end
  end
end