class AddSrvSortOrd < ActiveRecord::Migration
  def self.up
    add_column :portfolio_entries, :sort_order, :integer, :default => 0 
  end

  def self.down
    remove_column :portfolio_entries, :sort_order 
  end
end
