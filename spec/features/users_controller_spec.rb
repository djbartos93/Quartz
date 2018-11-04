require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before :each do
  @request.host = 'localhost:3000'
  end

  it "should be able to login" do
    user = create(:user)
    user.confirmed_at = Time.now
    user.save
    login_as(user, :scope => :user)
    Warden.test_reset!
  end

  it "should tell user to confirm if user is not confirmed" do
    session.visit(new_user_session_url)
    fill_in "Email", with: "spe@example.com"
    click_button 'next'
    fill_in "Password", with: "qwerty"
    click_button 'Log in'
    expect(page).to have_content("log")

  end



end
