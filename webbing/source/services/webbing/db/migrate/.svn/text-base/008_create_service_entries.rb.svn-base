class CreateServiceEntries < ActiveRecord::Migration
  def self.up
    create_table :service_entries do |t|
      t.column :title, :string
      t.column :description, :text
      t.column :image_id, :integer
    end
  end

  def self.down
    drop_table :service_entries
  end
end
