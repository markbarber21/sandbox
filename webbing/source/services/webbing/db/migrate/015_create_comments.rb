class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.column :body, :text
      t.column :who, :string
      t.column :when_created, :date
      t.column :accepted, :integer
      t.column :news_id, :integer
    end
  end

  def self.down
    drop_table :comments
  end
end
