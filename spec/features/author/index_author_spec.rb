require 'rails_helper'

describe "Index author page", type: :feature do
  before do
    @author = create :author
  end
  it "should exist at 'authors_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit authors_path
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    visit authors_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_text('Alan Turing')
    expect(page).to have_text('Name')
    expect(page).to have_text('Homepage')
    expect(page).to have_link 'Show', href: author_path(@author)
    expect(page).to have_link 'New', href: new_author_path
  end

  it "should have links to the edit author page" do
    visit authors_path
    expect(page).to have_link 'Edit', href: edit_author_path(@author)
  end
end
