require 'rails_helper'

describe "Index paper page", type: :feature do
  before do
    @author = create :author
    @paper = Paper.create(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
    @paper2 = Paper.create(title: "ELECTRIC VEHICLE COVERAGE", venue: "Mind 49: 433-460", year: 2016)
    @paper.authors << @author
  end

  it "should exist at 'papers_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit papers_path
  end

  it "should have text inputs for a paper's title, venue and year" do
    visit papers_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_text('COMPUTING MACHINERY AND INTELLIGENCE')
    expect(page).to have_text('Title')
    expect(page).to have_text('Venue')
    expect(page).to have_text('Year')
    expect(page).to have_link 'Show', href: paper_path(@paper)
    expect(page).to have_link 'New', href: new_paper_path
  end

  it "should have links to the edit paper page" do
    visit papers_path
    expect(page).to have_link 'Edit', href: edit_paper_path(@paper)
  end

  it "should have links to deleting the paper" do
    visit papers_path
    expect(page).to have_link 'Destroy', href: paper_path(@paper)
  end

  it "should filter papers by year" do
    visit '/papers?year=2016'
    expect(page).not_to have_text('COMPUTING MACHINERY AND INTELLIGENCE')
    expect(page).to have_text("ELECTRIC VEHICLE COVERAGE")
  end
end

