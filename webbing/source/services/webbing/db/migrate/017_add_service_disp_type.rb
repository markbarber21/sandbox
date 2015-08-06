class AddServiceDispType < ActiveRecord::Migration
  def self.up
    add_column :service_entries, :disp_type, :integer, :default => 0 
  end
    
  def self.down
    remove_column :service_entries, :disp_type 
  end
end
