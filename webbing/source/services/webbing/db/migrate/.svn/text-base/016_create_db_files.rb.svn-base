class CreateDbFiles < ActiveRecord::Migration
  
  def self.down
    drop_table :db_files
  end
  
  def self.up
    create_table :db_files do |t|
      t.column :name, :string
      t.column :body, :binary
    end
    add_index :db_files, :name, :unique => true
    
    ### Not doing data migration
    ### Also not deleting old data (for now, may be deleted in a future migration)
    
    ## Migrate Settings table to system settings
    #system_props = Properties.get('settings/system', Properties::DefaultSystemSettings)
    #Setting.find_all.each do |setting|
    #  name = setting.name.to_sym
    #  int_value = setting.value.to_i
    #  if int_value != 0 then system_props[name] = int_value
    #  else system_props[name] = setting.value
    #  end
    #end
    #
    ## Migrate CustomerInfo to customer settings and create separate image files
    #info = CompanyInfo.get()
    #customer_props = Properties.get('settings/customer', Properties::DefaultCustomerSettings)
    #customer_props[:company_name] = info.company_name
    #customer_props[:company_description] = info.company_description
    #customer_props[:welcome_text] = info.welcome_text
    #customer_props.save!
    #image_to_file(info.web_icon, 'images/web_icon')
    #image_to_file(info.logo_image, 'images/logo')
    #image_to_file(info.banner_image, 'images/banner')
    #image_to_file(info.sidebar_image, 'images/sidebar')
    #
    ## We could drop the customer_infos and settings table now, but doing so means
    ## we can't roll back this migration.
  
  end

  #def self.image_to_file(image_blob, file_name)
  #  if image_blob
  #    db_file = DbFile.find_or_initialize_by_name(file_name)
  #    db_file.name = file_name
  #    db_file.body = image_blob
  #    db_file.save!
  #  end
  #end

end
