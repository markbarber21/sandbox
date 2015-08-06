class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.column :title, :string
      t.column :when_created, :date
      t.column :who, :string
      t.column :body, :text
    end
  end

  def self.down
    drop_table :news
  end
end
