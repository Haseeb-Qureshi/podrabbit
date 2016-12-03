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
end
