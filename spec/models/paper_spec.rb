require 'rails_helper'

RSpec.describe Paper, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:title).of_type :string}
    it { is_expected.to have_db_column(:venue).of_type :string}
    it { is_expected.to have_db_column(:year).of_type :integer}
  end

  describe 'validations' do
    it 'should have a year' do
      paper = Paper.new(title: 'Electric vehicle Charging', venue: 'venue', year: nil)
      expect(paper).not_to be_valid
    end

    it 'should have a title' do
      paper = Paper.new(title: nil, venue: 'venue', year: 2016)
      expect(paper).not_to be_valid
    end

    it 'should have a venue' do
      paper = Paper.new(title: 'Electric vehicle Charging', venue: nil, year: 2016)
      expect(paper).not_to be_valid
    end

    it 'should have an integer year' do
      paper = Paper.new(title: 'Electric vehicle Charging', venue: 'venue', year: '2a016')
      expect(paper).not_to be_valid
    end
  end
end
