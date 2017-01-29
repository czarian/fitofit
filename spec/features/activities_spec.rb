require 'rails_helper'

RSpec.describe 'activities', type: :feature  do

  context 'Create new activities' do

    let(:start){'plac defilad 1, Warszawa, Polska'}
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
      expect(page).to have_content "The distance is #{1.7}"

    end

    it 'Try to create new activity with start too short' do

      fill_in :Start, with: 'Plac'
      fill_in :Destination, with: destination

      find_button('Submit').click()

      expect(page).to have_content "Start"
      expect(page).to have_content "error"
      expect(page).to have_content "Start is too short"

    end

    it 'Try to create new activity with invalid start' do

      fill_in :Start, with: 'Plac defilad 1 warszawa polska'
      fill_in :Destination, with: destination

      find_button('Submit').click()

      expect(page).to have_content "Start"
      expect(page).to have_content "error"
      expect(page).to have_content "Start is invalid"

    end

    it 'Try to create new activity with valid format, but invalid start address' do

      fill_in :Start, with: 'Plac, Kabuto, San escobar'
      fill_in :Destination, with: destination

      find_button('Submit').click()

      expect(page).to have_content "Start"
      expect(page).to have_content "error"
      expect(page).to have_content "Start address not found"
    end

    it 'Try to create new activity with valid format, but invalid destination address' do

      fill_in :Start, with: start
      fill_in :Destination, with: 'Plac, Kabuto, San escobar'

      find_button('Submit').click()

      expect(page).to have_content "Start"
      expect(page).to have_content "error"
      expect(page).to have_content "Destination address not found"
    end

  end

  context 'View statistics' do

    before :each do
      activity = Activity.new

      activity.start = 'Plac defilad 1, Warszawa, Polska'
      activity.destination = 'Plac zamkowy 1, Warszawa, Polska'
      activity.save

      activity = Activity.new

      activity.start = 'Plac defilad 1, Warszawa, Polska'
      activity.destination = 'Plac zamkowy 1, Warszawa, Polska'
      activity.save


      activity = Activity.new

      activity.start = 'Plac defilad 1, Warszawa, Polska'
      activity.destination = 'Plac zamkowy 1, Warszawa, Polska'
      activity.created_at = 2.week.ago.utc
      activity.save

    end

    it 'Show statistics from this week' do

      visit root_path

      expect(page).to have_content "1.7"
    end

    it 'Show statistics from this month, grouped by day' do

      visit root_path month: true

      expect(page).to have_content "3.4"
    end

  end

end
