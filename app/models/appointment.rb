class Appointment < ApplicationRecord

  belongs_to :user
  belongs_to :dentist

  def send_confirmation_sms
    client = Twilio::REST::Client.new(ENV['TWILIO_ID'], ENV['TWILIO_TOKEN'])

    client.api.account.messages.create(
      from: ENV['PHONE_NUMBER'],
      to: "+1#{self.user.phone}",
      body: "You have an appointment on #{self.appointment_at.strftime("%a, %v at %I:%M %p")} with #{self.dentist.name}"
    )
  end

end
