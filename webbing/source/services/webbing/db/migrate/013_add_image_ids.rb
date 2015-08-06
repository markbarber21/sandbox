class AddImageIds < ActiveRecord::Migration
  def self.up
    add_column :news, :image_id, :integer, :default => 0     
  end

  def self.down
    remove_column :news, :image_id     
  end
end
