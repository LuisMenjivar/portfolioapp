class AddAttachmentImageToBookmarks < ActiveRecord::Migration
  def self.up
    change_table :bookmarks do |t|
      t.attachment :image
    end
  end
  def self.down
    remove_attachment :bookmarks, :image
 end
end