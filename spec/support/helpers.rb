module Helpers
  def sign_in_as(user)
    visit sign_in_path
    fill_in "session_email", with: user.email
    fill_in "session_password", with: "test"
    click_button "Sign in"
  end

  def sign_in
    sign_in_as User.first
  end

  def sign_out
    visit sign_out_path
  end

  def controller_sign_in_as(user)
    @controller.stub(:current_user).and_return user
  end

  def controller_sign_in
    @controller.stub(:current_user).and_return User.first
  end
end