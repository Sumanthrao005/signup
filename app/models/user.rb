require 'bcrypt'
class User < ApplicationRecord
  has_many :articles
#  has_secure_token
# has_secure_token :auth_token

  before_save :encrypt_password
  before_save :generate_token

  validates :name,
  :presence=>{:message => "Name can't be blank." },
  :uniqueness=>{:message => "Name already exists."}
  validates :password,
  :presence=>{:message => "Password can't be blank."},
  :confirmation=> {:message => "Password should be same."}
  validates :email,
  :presence=>{:message => "Email can't be blank."}
    # :format=>{ :with=> ^(?=[a-zA-Z0-9]*$)([^A-Za-z0-9])}
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, password_salt)
end
end
def generate_token
  charset = Array('A'..'Z') + Array('a'..'z') + Array(0...9)
  self.token=Array.new(20) { charset.sample }.join

end
def self.authenticate(name, password)
  user = find_by_name(name)
  if user && user.password == BCrypt::Engine.hash_secret(password,
user.password_salt)
    user
  else
    nil
  end
end
end
