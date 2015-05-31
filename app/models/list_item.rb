# == Schema Information
#
# Table name: list_items
#
#  id         :integer          not null, primary key
#  list_id    :integer
#  name       :string
#  quantity   :integer
#  source     :integer          default(0), not null
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ListItem < ActiveRecord::Base

  #---------------------------------------------------------------------
  # Associations
  #---------------------------------------------------------------------

  belongs_to :list

  #---------------------------------------------------------------------
  # Enums
  #---------------------------------------------------------------------

  enum source: [ :from_system, :from_user ]

end
