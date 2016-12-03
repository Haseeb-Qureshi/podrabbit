# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  type            :string
#  first_name      :string           not null
#  last_name       :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  producer_id     :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_many :podcasts, inverse_of: :client
  has_one :producer, class_name: User.name, foreign_key: :producer_id

  validate :password, allow_nil: true, length: { minimum: 6 }

  before_create :ensure_valid_session_token!

  attr_accessor :password

  def password=(password)
    super
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def ensure_valid_session_token!
    self.session_token = new_session_token
    ensure_valid_session_token! if User.exists?(session_token: session_token)
    save!
  end

  def new_session_token
    SecureRandom.urlsafe_base64
  end
end
