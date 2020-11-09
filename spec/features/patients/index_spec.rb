require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the patient index page' do
    it 'should see all patients from oldest to youngest' do
      patient1 = Patient.create(name: 'Katie Bryce', age: 24)
      patient2 = Patient.create(name: 'Rebecca Pope', age: 32)
      patient3 = Patient.create(name: 'Zola Shephard', age: 2)

      visit '/patients'

      expect(page).to have_content('All Patients')
      within all('.patient')[0] do
        expect(page).to have_content(patient2.name)
        expect(page).to have_content(patient2.age)
      end

      within all('.patient')[1] do
        expect(page).to have_content(patient1.name)
        expect(page).to have_content(patient1.age)
      end

      within all('.patient')[2] do
        expect(page).to have_content(patient3.name)
        expect(page).to have_content(patient3.age)
      end
    end
  end
end