class User < ActiveRecord::Base
  has_secure_password
  has_many :secrets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes

  before_validation :email_lowercase
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  
  validates :name, :email, presence: true
  validates :password, presence: true 
  validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}

  private
    def email_lowercase
      self.email.downcase!
    end
end
