class User < ApplicationRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  if user && user.authenticate(password)
    return user
  else
    return nil
  end


end
