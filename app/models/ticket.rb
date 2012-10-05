class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :state
  belongs_to :user
  attr_accessible :description, :title, :assets_attributes

  has_many :assets
  accepts_nested_attributes_for :assets
  has_many :comments

  validates :title, :presence => true
  validates :description, :presence => true, :length => { :minimum => 10 }
  validates :user, :presence => true
end
