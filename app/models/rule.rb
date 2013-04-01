class Rule < ActiveRecord::Base
  attr_accessible :description, :title, :tag_list

  validates :title, presence: true

  belongs_to :user

  validates :user_id, presence: true

  acts_as_taggable_on :tags

  searchable do
  	text :title, :description, :tags
  end
end
