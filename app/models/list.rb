# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  trip_id    :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class List < ActiveRecord::Base

  #---------------------------------------------------------------------
  # Associations
  #---------------------------------------------------------------------

  belongs_to :trip
  has_many :list_items

end
