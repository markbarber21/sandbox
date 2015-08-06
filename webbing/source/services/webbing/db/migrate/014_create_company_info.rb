class CreateCompanyInfo < ActiveRecord::Migration
  @new_settings = [
    ['web_icon_size',          '32'],
    ['company_logo_size',      '128'],
    ['company_banner_width',   '400'],
    ['company_banner_height',  '60'],
    ['company_sidebar_width',  '200'],
    ['company_sidebar_height', '400'],
  ]
  
  def self.up
    create_table :company_infos do |t|
      t.column :company_name, :string
      t.column :company_description, :text
      t.column :welcome_text, :text
      t.column :web_icon, :binary
      t.column :logo_image, :binary
      t.column :banner_image, :binary
      t.column :sidebar_image, :binary
    end
    
    CompanyInfo.create!({
      :company_name => "Your Company Name",
      :company_description => "Your Company Description",
      :welcome_text => "Your Company Welcome",
    })
    
    @new_settings.each do |name, value|
      Setting.create!(:name => name, :value => value)
    end
    
  end
  
  def self.down
    drop_table :company_infos
    @new_settings.each do |name, value|
      Setting.destroy_all(['name = ?', name])
    end
  end
end
