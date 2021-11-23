require 'rails_helper'

describe "Edit author page", type: :feature do
  before do
    @author = create :author
  end

  it "should exist at 'edit_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit edit_author_path(@author)
  end
end

