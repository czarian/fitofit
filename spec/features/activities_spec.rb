require 'rails_helper'

RSpec.describe 'activities', type: :feature  do

  context 'Create new activities' do

    let(:start){'Plac defilad 1, Warszawa, Polska'}
    let(:destination){'Plac zamkowy 1, Warszawa, Polska'}

    before(:each) do
      visit new_activity_path
    end

    it 'Try to create new activity with valid data' do
      fill_in :Start, with: start
      fill_in :Destination, with: destination

      find_button('Submit').click()

      expect(page).to have_content start
      expect(page).to have_content destination
      expect(page).to have_content "You started from:"
    end

  end

end
