require 'rails_helper'

describe "Edit author page", type: :feature do
  before do
    @author = create :author
  end

  it "should exist at 'edit_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit edit_author_path(@author)
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    visit edit_author_path(@author)
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should update the author" do
    visit edit_author_path(@author)
    page.fill_in 'author[first_name]', with: 'Donald'
    page.fill_in 'author[last_name]', with: 'Trump'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Donald_Trump'
    find('input[type="submit"]').click
    expect(@author.reload).to have_attributes(first_name: 'Donald',
                                              last_name: 'Trump',
                                              homepage: 'http://wikipedia.org/Donald_Trump')
  end
end

