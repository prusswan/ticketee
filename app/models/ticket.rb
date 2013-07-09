class Ticket < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :description, length: { minimum: 10 }

  belongs_to :project
  belongs_to :user

  mount_uploader :asset, AssetUploader
end
