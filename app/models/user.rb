class User < ApplicationRecord
  has_secure_password

  has_many :faves
  has_many :songs, through: :faves

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, presence: true, :on => :create
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }, :on => :create
  validates :password, :password_confirmation, presence: true, length: {minimum: 8}

end
