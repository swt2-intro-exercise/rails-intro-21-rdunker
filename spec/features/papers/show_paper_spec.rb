require 'rails_helper'

describe "Show paper page", type: :feature do
  before do
    @author = create :author
    @paper = Paper.create(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
    @paper.authors << @author
  end
  it "should exist at 'show_paper_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit paper_path(@paper)
  end

  it "should show papers title, year and venue" do
    visit paper_path(@paper)
    expect(page).to have_text("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(page).to have_text("Mind 49: 433-460")
    expect(page).to have_text("1950")
  end

  it "should show the authors names" do
    visit paper_path(@paper)
    expect(page).to have_text("Alan Turing")
  end
end


