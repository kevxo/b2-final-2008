require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a doctors show page' do
    it 'should see doctors info, hospital of where they work and all their patients' do
      hospital = Hospital.create(name: 'Grey Sloan Memorial Hospital')
      doctor = hospital.doctors.create(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
      patient1 = Patient.create(name: 'Katie Bryce', age: 24)
      patient2 = Patient.create(name: 'Rebecca Pope', age: 32)
      PatientDoctor.create(patient_id: patient1.id, doctor_id: doctor.id)
      PatientDoctor.create(patient_id: patient2.id, doctor_id: doctor.id)

      visit "/doctors/#{doctor.id}"

      expect(page).to have_content('Doctor Info:')
      expect(page).to have_content(doctor.name)
      expect(page).to have_content(doctor.specialty)
      expect(page).to have_content(doctor.university)
      expect(page).to have_content('Hospital:')
      expect(page).to have_content(hospital.name)
      expect(page).to have_content('Patients:')
      expect(page).to have_content(patient1.name)
      expect(page).to have_content(patient2.name)
    end
  end
end