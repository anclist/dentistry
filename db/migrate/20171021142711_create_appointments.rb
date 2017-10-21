class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :dentist_id
      t.datetime :appointment_at
      t.string :status
      t.string :notes

      t.timestamps
    end
  end
end
