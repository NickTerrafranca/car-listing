require 'rails_helper'

feature 'creates a car listing', %q(
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
    * I must specify the manufacturer, color, year, and mileage of the car.
    * Only years from 1920 and above can be specified.
    * I can optionally specify a description of the car.
    * If I enter all of the required information in the required formats,
      the car is recorded and I am presented
      with a notification of success
    * If I do not specify all of the required information in the required
      formats, the car is not recorded and
      I am presented with errors.
    * Upon successfully creating a car, I am redirected back to the index of
      cars.
  ) do

  scenario 'inserts valid input in all fields' do
    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.create(:car, manufacturer: manufacturer)
    visit new_car_path
    fill_in 'Year', with: car.year
    fill_in 'Model', with: car.model

    select manufacturer.name, from: 'Manufacturer'

    fill_in 'Mileage', with: car.mileage
    fill_in 'Color', with: car.color
    fill_in 'Description', with: car.description
    click_button 'Submit'

    expect(page).to have_content car.year
    expect(page).to have_content car.manufacturer.name
    expect(page).to have_content 'Successfully created...'
  end

  scenario 'inserts valid input in required fields only' do
    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.create(:car, manufacturer: manufacturer)
    visit new_car_path
    fill_in 'Year', with: car.year
    fill_in 'Model', with: car.model

    select manufacturer.name, from: 'Manufacturer'

    fill_in 'Mileage', with: car.mileage
    fill_in 'Color', with: car.color
    click_button 'Submit'

    expect(page).to have_content car.year
    expect(page).to have_content car.manufacturer.name
    expect(page).to have_content 'Successfully created...'
  end

  scenario 'inserts invalid year input' do
    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.create(:car, manufacturer: manufacturer)
    visit new_car_path
    fill_in 'Year', with: '1911'
    fill_in 'Model', with: car.model

    select manufacturer.name, from: 'Manufacturer'

    fill_in 'Mileage', with: car.mileage
    fill_in 'Color', with: car.color
    click_button 'Submit'

    expect(page).to_not have_content car.year
    expect(page).to have_content 'There was a problem saving your submission...'
  end

  scenario 'inserts invalid year input' do
    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.create(:car, manufacturer: manufacturer)
    visit new_car_path
    click_button 'Submit'

    expect(page).to_not have_content car.year
    expect(page).to have_content 'There was a problem saving your submission...'
  end
end
