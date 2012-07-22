class AddAttachmentAssetToTickets < ActiveRecord::Migration
  def self.up
    change_table :tickets do |t|
      t.has_attached_file :asset
    end
  end

  def self.down
    drop_attached_file :tickets, :asset
  end
end
