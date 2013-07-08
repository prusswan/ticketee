require 'spec_helper'

feature "signing in." do
  scenario 'Signing in via form' do
    user = FactoryGirl.create(:user)

    sign_in_as!(user)

    expect(page).to have_content("Signed in successfully.")
  end
end
