class User < ActiveRecord::Base
  has_secure_password
  before_save :email_lowercase
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  
  validates :name, :email, presence: true
  validates :password, presence: true 
  validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}

  private
    def email_lowercase
      self.email.downcase!
    end
end
