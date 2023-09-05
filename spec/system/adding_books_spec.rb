require 'rails_helper'

RSpec.describe "AddingBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'valid title' do
    visit new_book_path
    fill_in 'Title', with: 'Sample Book'
    fill_in 'Author', with: 'Sample Author'
    fill_in 'Price', with: '9.99'
    click_button 'Create Book'
    expect(page).to have_content('Book was successfully created.')
  end

  it 'invalid title' do
    visit new_book_path
    #leave title blank
    fill_in 'Author', with: 'Sample Author'
    fill_in 'Price', with: '9.99'
    click_button 'Create Book'
    expect(page).to have_content("Title can't be blank")
  end

  it 'valid author' do
    visit new_book_path
    fill_in 'Title', with: 'Sample Book'
    fill_in 'Author', with: 'Sample Author'
    fill_in 'Price', with: '9.99'
    click_button 'Create Book'
    expect(page).to have_content('Book was successfully created.')
  end

  it 'invalid author' do
    visit new_book_path
    fill_in 'Title', with: 'Sample Book'
    #leave author blank
    fill_in 'Price', with: '9.99'
    click_button 'Create Book'
    expect(page).to have_content("Author can't be blank")
  end

  it 'valid price' do
    visit new_book_path
    fill_in 'Title', with: 'Sample Book'
    fill_in 'Author', with: 'Sample Author'
    fill_in 'Price', with: '9.99'
    click_button 'Create Book'
    expect(page).to have_content('Book was successfully created.')
  end

  it 'invalid price' do
    visit new_book_path
    fill_in 'Title', with: 'Sample Book'
    fill_in 'Author', with: 'Sample Author'
    #leave price blank
    click_button 'Create Book'
    expect(page).to have_content("Price can't be blank")
  end

  it 'valid date' do
    visit new_book_path
    fill_in 'Title', with: 'Sample Book'
    fill_in 'Author', with: 'Sample Author'
    fill_in 'Price', with: '9.99'
    # Select a published date from the drop-down menu
    select '2023', from: 'book_published_date_1i' # Year
    select 'September', from: 'book_published_date_2i' # Month
    select '5', from: 'book_published_date_3i' # Day
    click_button 'Create Book'
    expect(page).to have_content('Book was successfully created.')
  end
end
