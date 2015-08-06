class CreateRecommendations < ActiveRecord::Migration
  def self.up
    create_table :recommendations do |t|
      t.column :title, :string
      t.column :link, :text
      t.column :image_id, :integer
    end
  end

  def self.down
    drop_table :recommendations
  end
end
