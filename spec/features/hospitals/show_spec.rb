require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit the hospital show page' do
    it 'should see the name, number of doctors that work, and list of universities' do
      hospital = Hospital.create(name: 'Grey Sloan Memorial Hospital')
      doctor1 = hospital.doctors.create(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
      doctor2 = hospital.doctors.create(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University')
      doctor3 = hospital.doctors.create(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University')

      visit "/hospitals/#{hospital.id}"

      expect(page).to have_content(hospital.name)
      expect(page).to have_content("Number of Doctors: #{hospital.doctor_count}")

      expect(page).to have_content('List of Doctor Universities')
      within "#list-of-universities-#{doctor1.id}" do
        expect(page).to have_content(doctor1.university)
      end

      within "#list-of-universities-#{doctor2.id}" do
        expect(page).to have_content(doctor2.university)
      end

      within "#list-of-universities-#{doctor3.id}" do
        expect(page).to have_content(doctor3.university)
      end
    end
  end
end