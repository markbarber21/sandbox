class AddPortServiceId < ActiveRecord::Migration
  def self.up
    add_column :portfolio_entries, :service_entry_id, :integer, :default => 0 
  end

  def self.down
    remove_column :portfolio_entries, :service_entry_id 
  end
end
