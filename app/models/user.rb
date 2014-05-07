class User < ActiveRecord::Base
  has_many :notes

  # Removing presence validations to integraet with Twitter OAuth
  # validates :name, presence: {message: "Please provide your name." }
  # validates :email, presence: {message: "Please provide a valid email address."}
  validates_uniqueness_of :name, :email
  # BUGBUG: Using BCrpyt, I can't validate presence of password

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
