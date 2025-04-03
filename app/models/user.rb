class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true


  # Method for authentication
  def self.authenticate_with_credentials(email, password)

    # return nil if email is nil
    return nil if email.nil?

    # clean up the email (strip spaces and downcase)
    clean_email = email.strip.downcase

    user = User.find_by_email(clean_email)

    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
