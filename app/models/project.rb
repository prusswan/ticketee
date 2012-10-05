class Project < ActiveRecord::Base
  has_many :tickets, :dependent => :delete_all
  validates :name, :presence => true, :uniqueness => true

  has_many :permissions, :as => :thing

  def self.viewable_by(user)
    joins(:permissions).where(:permissions => { :action => "view",
                                                :user_id => user.id })
  end
end
