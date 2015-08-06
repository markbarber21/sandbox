class CreateTestimonialEntries < ActiveRecord::Migration
  def self.up
    create_table :testimonial_entries do |t|
      t.column :customer_name, :string
      t.column :testimonial, :text
    end
  end

  def self.down
    drop_table :testimonial_entries
  end
end
