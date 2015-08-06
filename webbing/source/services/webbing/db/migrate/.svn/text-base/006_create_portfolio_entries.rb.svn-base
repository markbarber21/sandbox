class CreatePortfolioEntries < ActiveRecord::Migration
  def self.up
    create_table :portfolio_entries do |t|
      t.column :title, :string
      t.column :description, :text
      t.column :image_id, :integer
    end
  end

  def self.down
    drop_table :portfolio_entries
  end
end
