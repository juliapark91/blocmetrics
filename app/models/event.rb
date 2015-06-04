# == Schema Information
#
# Table name: events
#
#  id                        :integer          not null, primary key
#  name                      :string
#  registered_application_id :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  user_id                   :integer
#

class Event < ActiveRecord::Base
  belongs_to :registered_application
  has_many :users, through: :registered_applications
end
