class CreateDisclosures < ActiveRecord::Migration
  def self.up
    create_table :disclosures do |t|
      t.column :description, :text
    end
  end

  def self.down
    drop_table :disclosures
  end
end
