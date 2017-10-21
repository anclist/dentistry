class User < ApplicationRecord

  has_many :appointments
  # has_many :dentist, through: :appointments
end
