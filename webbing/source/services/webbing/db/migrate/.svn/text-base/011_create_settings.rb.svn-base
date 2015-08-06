class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.column :name, :string
      t.column :value, :string
    end
    add_index :settings, :name, :unique => true

    Setting.create!(:name => 'large_image_size', :value => "800")
    Setting.create!(:name => 'thumb_image_size', :value => "128")
  end

  def self.down
    drop_table :settings
  end
end
