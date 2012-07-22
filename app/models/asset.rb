class Asset < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :ticket

  has_attached_file :asset, path: "#{Rails.root}files/:id", url: "/files/:id"
end
