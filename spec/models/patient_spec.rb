require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it {should have_many :patient_doctors}
    it {should have_many(:doctors).through(:patient_doctors)}

  end

  describe 'model methods' do
    it '.order_by' do
      patient1 = Patient.create(name: 'Katie Bryce', age: 24)
      patient2 = Patient.create(name: 'Rebecca Pope', age: 32)
      patient3 = Patient.create(name: 'Zola Shephard', age: 2)

      expected = [patient2, patient1, patient3]

      expect(Patient.order_by).to eq(expected)
    end
  end
end
