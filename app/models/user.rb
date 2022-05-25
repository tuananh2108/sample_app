class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.user.email_regex
  USER_ATTRIBUTE = [:name, :email, :password, :password_confirmation].freeze

  before_save :downcase_email

  validates :email, presence: true,
            length: {maximum: Settings.user.email.max_length},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  validates :name, presence: true,
            length: {maximum: Settings.user.name.max_length}

  validates :password, presence: true,
            length: {minimum: Settings.user.password.min_length}, if: :password

  has_secure_password

  def self.digest string
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create string, cost:
  end

  private
  def downcase_email
    email.downcase!
  end
end
