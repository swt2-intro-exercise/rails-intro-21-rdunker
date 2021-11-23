require 'rails_helper'

describe "Show author page", type: :feature do
  before do
    @author = create :author
  end
  it "should exist at 'show_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit author_path(@author)
  end

  it "should show authors name and homepage" do
    visit author_path(@author)
    expect(page).to have_text("Alan Turing")
    expect(page).to have_text("http://wikipedia.de/Alan_Turing")
  end

end

