require 'rails_helper'

feature 'creates a manufacturer', %q(
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
  * Must specify a manufacturer name and country.
  * If I do not specify the required information, I am presented with errors.
    * If I specify the required information, the manufacturer is recorded and I
    am redirected to the index of manufacturers.
    ) do

  scenario 'inserts valid input' do
    manufacturer = FactoryGirl.build(:manufacturer)

    visit new_manufacturer_path

    fill_in 'Name', with: manufacturer.name
    fill_in 'Country', with: manufacturer.country
    click_button 'Submit'

    expect(page).to have_content manufacturer.name
    expect(page).to have_content manufacturer.country
    expect(page).to have_content 'Successfully created...'
  end

  scenario 'inserts invalid input' do
    visit new_manufacturer_path

    click_button 'Submit'

    expect(page).to_not have_content 'Successfully created...'
    expect(page).to have_content "can't be blank"
  end

  scenario 'inserts repeated input' do
    manufacturer = FactoryGirl.create(:manufacturer)

    visit new_manufacturer_path

    fill_in 'Name', with: manufacturer.name
    fill_in 'Country', with: manufacturer.country
    click_button 'Submit'

    expect(page).to_not have_content 'Successfully created...'
    expect(page).to have_content 'has already been taken'
  end
end
