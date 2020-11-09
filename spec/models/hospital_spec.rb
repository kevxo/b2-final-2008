require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe 'instance methods' do
    it '.doctor_count' do
      hospital = Hospital.create(name: 'Grey Sloan Memorial Hospital')
      doctor1 = hospital.doctors.create(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
      doctor2 = hospital.doctors.create(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University')
      doctor3 = hospital.doctors.create(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University')

      expect(hospital.doctor_count).to eq(3)
    end
  end
end
