# == Schema Information
#
# Table name: lists
#
#  id          :integer         not null, primary key
#  list_name   :string(255)
#  list_item1  :string(255)
#  list_item2  :string(255)
#  list_item3  :string(255)
#  list_item4  :string(255)
#  list_item5  :string(255)
#  list_item6  :string(255)
#  list_item7  :string(255)
#  list_item8  :string(255)
#  list_item9  :string(255)
#  list_item10 :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#
class List < ActiveRecord::Base
	attr_accessible :list_name, :list_item1, :list_item2, :list_item3, :list_item4, :list_item5,
                    :list_item6, :list_item7, :list_item8, :list_item9, :list_item10

    belongs_to :user 

    default_scope :order => 'lists.created_at DESC'
end
