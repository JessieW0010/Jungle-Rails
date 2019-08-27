class User < ActiveRecord::Base

  has_secure_password
  
  def self.authenticate_with_credentials(email, password)
    # if password matches, will return a user object 
    User.find_by_email(email).try(:authenticate, password)
  end

  validates_presence_of :firstname, :lastname
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: {case_sensitive: true}
  validates_length_of :password, minimum: 5

end
