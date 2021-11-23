require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:first_name).of_type :string}
    it { is_expected.to have_db_column(:last_name).of_type :string}
    it { is_expected.to have_db_column(:homepage).of_type :string}
  end

  describe 'methods' do
    it 'should build the complete name' do
      author = Author.create(first_name: 'Alan', last_name: 'Turing', homepage: '"http://wikipedia.org/Alan_Turing"')
      expect(author.name).to eq 'Alan Turing'
    end
  end

  describe 'validations' do
    it 'should have a last name' do
      author = Author.new(first_name: 'Alan', last_name: nil, homepage: '"http://wikipedia.org/Alan_Turing"')
      expect(author).not_to be_valid
    end
  end
end
