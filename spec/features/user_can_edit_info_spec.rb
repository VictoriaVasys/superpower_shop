require 'rails_helper'

RSpec.feature "User goes to edit profile page" do
  context "and can edit credentials" do
    it "edits account" do
      user = User.create(first_name: "brett", last_name: "schwartz", address: '34 turing lane', email: "bschwartz@example.com", password: "password", password_confirmation: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      click_on "Edit Account"

      fill_in "user[first_name]", with: "Ken"
      fill_in "user[last_name]", with: "Lee"
      fill_in "user[email]", with: "ken@example.com"
      fill_in "user[password]", with: "123abc"
      fill_in "user[password_confirmation]", with: "123abc"

      within('.account_form') do
        click_on "create your secret identity"
      end

      expect(current_path).to eq('/dashboard')
      expect(page).to have_text("Logged in as Ken")
      expect(page).to have_content(user.first_name)
      expect(page).to_not have_link("Put on Your Mask")
      expect(page).to have_content("Return to Human")
    end
  end
end
