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

    # test for email case sensitivity
    it 'should have a unique email (case insensitive)' do
      User.create(
        first_name: "John",
        last_name: "Doe",
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      )
      
      user = User.new(
        first_name: "Jane",
        last_name: "Doe",
        email: "TEST@EXAMPLE.COM",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Email has already been taken")
    end

    # test email
    it 'should require an email' do
      user = User.new(
        first_name: "John",
        last_name: "Doe",
        email: nil,
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    # test first name
    it 'should require a first name' do
      user = User.new(
        first_name: nil,
        last_name: "Doe",
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    # test last name
    it 'should require a last name' do
      user = User.new(
        first_name: "John",
        last_name: nil,
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    # test password minimum
    it 'should have a password with minimum length of 8 characters' do
      user = User.new(
        first_name: "John",
        last_name: "Doe",
        email: "test@example.com",
        password: "short",
        password_confirmation: "short"
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
  end


  describe '.authenticate_with_credentials' do
    # Setup a user before each test
    before do
      @user = User.create(
        first_name: "John",
        last_name: "Doe",
        email: "example@domain.com",
        password: "password",
        password_confirmation: "password"
      )
    end

    # test successful authentication
    it 'should authenticate with valid credentials' do
      authenticated_user = User.authenticate_with_credentials("example@domain.com", "password")
      expect(authenticated_user).to eq(@user)
    end

    # test failed authentication using wrong password
    it 'should not authenticate with wrong password' do
      authenticated_user = User.authenticate_with_credentials("example@domain.com", "wrongpassword")
      expect(authenticated_user).to be_nil
    end

    # test authentication with spaces around email
    it 'should authenticate with spaces around email' do
      authenticated_user = User.authenticate_with_credentials(" example@domain.com ", "password")
      expect(authenticated_user).to eq(@user)
    end

    # test authentication with wrong case senstivity
    it 'should authenticate with wrong case in email' do
      authenticated_user = User.authenticate_with_credentials("EXAMPLe@DOMAIN.CoM", "password")
      expect(authenticated_user).to eq(@user)
    end
  end



  
  

  
end
