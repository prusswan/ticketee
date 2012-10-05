class Permission < ActiveRecord::Base
  belongs_to :user
  belongs_to :thing, polymorphic: true
  attr_accessible :action, :thing, :user
end
