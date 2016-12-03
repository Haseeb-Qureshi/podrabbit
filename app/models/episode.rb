# == Schema Information
#
# Table name: episodes
#
#  id          :integer          not null, primary key
#  podcast_id  :integer
#  status      :string           not null
#  name        :string           not null
#  created_at  :datetime
#  updated_at  :datetime
#  producer_id :integer
#

class Episode < ActiveRecord::Base
  belongs_to :podcast
  belongs_to :producer, class_name: User.name
  has_one :client, through: :podcast
  has_many :file_uploads
end
