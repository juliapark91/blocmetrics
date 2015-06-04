# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  url        :string
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ActiveRecord::Base
  belongs_to :registered_application
  has_many :users, through: :registered_applications
end
