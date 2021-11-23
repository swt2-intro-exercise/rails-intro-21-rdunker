require 'rails_helper'

describe "Edit paper page", type: :feature do
  before do
    @author = create :author
    @paper = Paper.create(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
    @paper.authors << @author
  end

  it "should exist at 'edit_paper_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit edit_paper_path(@paper)
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    visit edit_paper_path(@paper)
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end

  it "should update the paper" do
    visit edit_paper_path(@paper)
    page.fill_in 'paper[title]', with: 'title'
    page.fill_in 'paper[venue]', with: 'venue'
    page.fill_in 'paper[year]', with: 1999
    find('input[type="submit"]').click
    expect(@paper.reload).to have_attributes(title: 'title',
                                             venue: 'venue',
                                             year: 1999)
  end

  
end


