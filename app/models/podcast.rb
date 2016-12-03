# == Schema Information
#
# Table name: podcasts
#
#  id         :integer          not null, primary key
#  client_id  :integer
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Podcast < ActiveRecord::Base
  has_many :episodes
  belongs_to :client, class_name: User.name
end
