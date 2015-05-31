# == Schema Information
#
# Table name: trips
#
#  id            :integer          not null, primary key
#  location_name :string
#  latlong       :point
#  duration_days :integer
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Trip < ActiveRecord::Base


  #---------------------------------------------------------------------
  # Associations
  #---------------------------------------------------------------------

  has_many :lists

end
