require 'spec_helper'

describe 'admin page', js: true do
  let(:user) { users(:admin) }
  it 'allows login' do
    visit admin_index_path
    current_path.should_not == admin_index_path

    within "Form" do
      page.should have_css("input[id=session_email]")
      page.should have_css("input[id=session_password]")

      fill_in "session_email", with: user.email
      fill_in "session_password", with: "test"
      click_button "Sign in"
    end

    visit admin_index_path
    current_path.should == admin_index_path
  end
end
