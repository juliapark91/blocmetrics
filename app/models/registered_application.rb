# == Schema Information
#
# Table name: registered_applications
#
#  id         :integer          not null, primary key
#  url        :string
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :url
end
