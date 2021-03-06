require 'rails_helper'

RSpec.feature "User logging out of account" do
  context "when clicking log out" do
    scenario "successfully logs out" do

      user = User.create(first_name: "brett", last_name: "schwartz", address: '34 turing lane', email: "bschwartz@example.com", password: "password", password_confirmation: "password")

      visit login_path

      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: "password"

      click_on "enter at your own risk"

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content user.first_name

      click_on "Return to Human"

      expect(current_path).to eq(login_path)

    end
  end
end
