require 'rails_helper'

describe User do
  describe 'phone validation' do
    it 'is valid when 10 digits' do
      user = User.new(
        name: "Tony",
        email: "anclist@gmail.com",
        phone: "6474713759",
        password: "password"
      )
      expect(user.valid?).to eq(true)
    end

    it 'is invalid when not 10 digits' do
      user = User.new(
        name: "Tony",
        email: "anclist@gmail.com",
        phone: "644713759",
        password: "password"
      )
      expect(user.valid?).to eq(false)
      expect(user.errors[:phone]).to eq(['must be in format 1234567890'])
    end
  end
end
