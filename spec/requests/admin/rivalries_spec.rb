require 'spec_helper'

describe Rivalry, js: true do
  before { sign_in_as_admin }
  it "user is unable to access" do
    sign_out
    sign_in # as user not admin
    visit admin_rivalries_path
    current_path.should_not == admin_rivalries_path
  end

  it "should list the rivalries" do
    visit admin_rivalries_path
    Rivalry.all.each do |rivalry|
      page.should have_content rivalry.to_s
    end
  end

  it "should allow the creation of a rivalry" do
    visit admin_rivalries_path
    click_on "new"
    current_path.should == new_admin_rivalry_path
    Character.all.each do |character|
      page.should have_content character.name
    end

    character1, character2 = Character.all.sample(2)
    check character1.name
    check character2.name
    click_on "Create Rivalry"

    page.should have_content character1.name
    page.should have_content character1.caption
    page.should have_content character2.name
    page.should have_content character2.caption

    page.should have_content "Votes"
  end

  it "should allow the deletion of a rivalry" do
    visit admin_rivalries_path
    count = Rivalry.count
    within("ul li:first") { click_on "Delete" }
    dialog = page.driver.browser.switch_to.alert
    dialog.accept
    sleep 1
    Rivalry.count.should == count - 1
  end

  it "should allow the ability to vote for a rivalry_character" do
    rivalry = Factory(:pair_rivalry)
    visit admin_rivalries_path

    within("#container ul") { click_on rivalry.to_s }
    current_path.should == admin_rivalry_path(rivalry)

    lambda {
      rivalry_character = rivalry.rivalry_characters.sample
      within("section.rivalry_character_#{rivalry_character.id}") { click_on "Vote" }
      wait_until { page.should have_css("section.rivalry_character.voted") }
    }.should change { Vote.count }.by(1)
  end
end
