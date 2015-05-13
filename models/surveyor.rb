class Surveyor < ActiveRecord::Base
  include BCrypt

  before_save :encrypt_password

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def encrypt_password
    self[:encrypted_password] = BCrypt::Password.create(self.password)
  end

  def self.authenticate email, password
    u = Surveyor.find_by_email(email)
    if u.password == password
      u.api_key = SecureRandom.uuid
      u.save!
      u
    else
      nil
    end
  end

  def self.logout api_key
    u = Surveyor.find_by_api_key(api_key)
    if !u.nil?
      u.api_key = nil
      u.save!
      u
    else
      nil
    end
  end
end