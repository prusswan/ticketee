class Project < ActiveRecord::Base
  has_many :tickets
  validates :name, :presence => true, :uniqueness => true

  has_many :permissions, :as => :thing
  scope :readable_by, lambda { |user|
    joins(:permissions).where(:permissions => { :action => "view",
                                                :user_id => user.id })
  }
end
