require 'spec_helper'

describe 'admin page', js: true do
  let(:user) { User.first }
  it 'allows login' do
    visit admin_rivals_path
    current_path.should_not == admin_rivals_path

    within "Form" do
      page.should have_css("input[id=session_email]")
      page.should have_css("input[id=session_password]")

      p user.email, user.password
      fill_in "session_email", with: user.email
      fill_in "session_password", with: "test"
      click_button "Sign in"
    end
    
    current_path.should == admin_rivals_path
  end
end