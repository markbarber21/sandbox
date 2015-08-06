class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.column :type_location, :integer
      t.column :description, :string
      t.column :name, :string
      t.column :adr_line1, :string
      t.column :adr_line2, :string
      t.column :city, :string
      t.column :state, :string
      t.column :postal_code, :string
      t.column :phone, :string
      t.column :cell, :string
      t.column :office_phone, :string
      t.column :fax, :string
      t.column :email, :string
      t.column :image_id, :integer
    end
  end

  def self.down
    drop_table :contacts
  end
end
