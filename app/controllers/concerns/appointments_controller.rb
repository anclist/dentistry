class AppointmentsController < ApplicationController
  before_action :require_logged_in

  def index
    @appointments = current_user.appointments.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = current_user.id

    if @appointment.save
      flash[:notice] = "Your appointment has been saved."
      redirect_to appointments_url
    else
      render :new
    end
  end

private

def appointment_params
  params.require(:appointment).permit(:dentist_id, :appointment_at)
end

end
