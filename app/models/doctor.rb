class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :patient_doctors, dependent: :destroy
  has_many :patients, through: :patient_doctors
end
