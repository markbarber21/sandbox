class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.column :content_type, :string
      t.column :large, :binary, :limit => 10.megabytes
      t.column :thumb, :binary, :limit => 1.megabyte
      t.column :caption, :string
    end
  end

  def self.down
    drop_table :images
  end
end
