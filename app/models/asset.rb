class Asset < ActiveRecord::Base
  belongs_to :ticket

  mount_uploader :asset, AssetUploader

  before_save :update_content_type

  private
    def update_content_type
      if asset.present? && asset_changed?
        self.content_type = asset.file.content_type
      end
    end
end
