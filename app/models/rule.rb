class Rule < ActiveRecord::Base
  attr_accessible :description, :title

  validates :title, presence: true

  belongs_to :user

  validates :user_id, presence: true
end
