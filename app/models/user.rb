class User < ActiveRecord::Base
  has_secure_password
  before_save { email.downcase! }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 5 }
  validates :email, :uniqueness => { :case_sensitive => false }, presence: true, format: { with: VALID_EMAIL_REGEX }, on: :create

  def self.authenticate_with_credentials(email, password)
    email = email.delete(' ')
    email.downcase!
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
