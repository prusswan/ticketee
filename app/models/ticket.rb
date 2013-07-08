class Ticket < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :description, length: { minimum: 10 }

  belongs_to :project
end
