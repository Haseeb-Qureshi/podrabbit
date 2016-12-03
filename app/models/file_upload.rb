# == Schema Information
#
# Table name: file_uploads
#
#  id         :integer          not null, primary key
#  episode_id :integer
#  name       :string
#  url        :text
#  created_at :datetime
#  updated_at :datetime
#

class FileUpload < ActiveRecord::Base
  belongs_to :episode
  has_one :podcast, through: :episode
  has_one :client, through: :episode
  has_one :producer, through: :episode
end
