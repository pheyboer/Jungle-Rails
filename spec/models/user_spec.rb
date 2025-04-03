require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # Test user creation with all fields
    it 'should create a valid user' do
      user = User.new(
        first_name: "John",
        last_name: "Doe",
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to be_valid
    end
  
  

  end
end
