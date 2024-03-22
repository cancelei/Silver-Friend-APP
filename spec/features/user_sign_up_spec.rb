require 'rails_helper'

RSpec.feature "Different User Role Signs up: >", type: :feature do
  scenario 'Consumer signs up and uses consumer-specific features' do
    visit new_dim_user_registration_path
    fill_in 'Email', with: 'consumer@example.com'
    fill_in 'Password', with: 'password123'
    fill_in 'Password confirmation', with: 'password123'
    select 'Consumer', from: 'dim_user_account_type'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')

    # For the future: Example of interacting with a consumer-specific feature
    # visit consumer_dashboard_path
    # expect(page).to have_content('Consumer Dashboard')
  end

  scenario 'Provider signs up and accesses provider-specific features' do
    visit new_dim_user_registration_path
    fill_in 'Email', with: 'provider@example.com'
    fill_in 'Password', with: 'password123'
    fill_in 'Password confirmation', with: 'password123'
    select 'Provider', from: 'dim_user_account_type'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')

    # For the future: Example of interacting with a provider-specific feature
    # visit provider_services_path
    # expect(page).to have_content('Your Services')
  end
end
