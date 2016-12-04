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

  validates :password, length: { minimum: 6, allow_nil: true }

  after_create :generate_session_token!

  attr_accessor :password

  def self.find_by_credentials(email, password)
    user = find_by(email: email)
    user if user.try(:is_password?, password)
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def generate_session_token!
    self.session_token = self.class.new_session_token
    generate_session_token! if User.exists?(session_token: session_token)
    save!
    session_token
  end

  def self.new_session_token
    SecureRandom.urlsafe_base64
  end
end
