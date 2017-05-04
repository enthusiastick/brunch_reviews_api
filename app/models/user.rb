class User < ApplicationRecord
  EMAIL_REGEXP = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  HANDLE_REGEXP = /\A[A-Za-z0-9]+(?:[_-][A-Za-z0-9]+)*\z/

  attr_accessor :password_reset_token

  before_save :downcase_email

  has_secure_password

  validates_format_of :email, with: EMAIL_REGEXP
  validates_format_of :handle, with: HANDLE_REGEXP, message: "may only contain letters, numbers, dashes, and underscores (no spaces or other special characters), and must begin with a letter or number"
  validates_length_of :handle, in: 3..30
  validates_uniqueness_of :email, :handle

  scope :by_name, -> { order(:first_name) }

  def downcase_email
    self.email.downcase!
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def to_param
    handle
  end
end
