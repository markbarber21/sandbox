class AddEntSortOrd < ActiveRecord::Migration
  def self.up
    add_column :service_entries, :sort_order, :integer, :default => 0 
  end

  def self.down
    remove_column :service_entries, :sort_order 
  end
end
