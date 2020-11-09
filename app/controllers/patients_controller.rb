class PatientsController < ApplicationController
  def destroy
    patient = Patient.find(params[:id])
    doctor = Doctor.find_by(id: patient.doctors.pluck(:id))
    patient.destroy
    redirect_to "/doctors/#{doctor.id}"
  end
end