require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # testing user creation with all fields
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

    # test for password and password_confirmation match
    it 'should have matching password and password_confirmation' do
      user = User.new(
        first_name: "John",
        last_name: "Doe",
        email: "test@example.com",
        password: "password",
        password_confirmation: "different"
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should require password and password_confirmation fields' do
      user = User.new(
        first_name: "John",
        last_name: "Doe",
        email: "test@example.com",
        password: nil,
        password_confirmation: nil
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
  
  

  end
end
