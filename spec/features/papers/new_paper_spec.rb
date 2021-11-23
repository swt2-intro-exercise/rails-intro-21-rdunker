require 'rails_helper'

describe "New paper page", type: :feature do
  it "should exist at 'new_paper' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_paper_path
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    visit new_paper_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end

  it "should save the author from the filled in data" do
    visit new_paper_path
    page.fill_in 'paper[title]', with: 'Electric Vehicle Charging'
    page.fill_in 'paper[venue]', with: '...'
    page.fill_in 'paper[year]', with: 2016
    find('input[type="submit"]').click
    expect(Paper.where(title: 'Electric Vehicle Charging', venue: '...', year: 2016).count).to eq 1
  end

  it "should display an error on an invalid input" do
    visit new_paper_path
    page.fill_in 'paper[title]', with: 'Electric Vehicle Charging'
    page.fill_in 'paper[venue]', with: '...'
    find('input[type="submit"]').click
    expect(page).to have_text('error')
  end
end

