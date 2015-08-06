class AddDefaultSettings < ActiveRecord::Migration

  def self.up
    system_default = DbFile.find_or_initialize_by_name("settings/system")
    system_default.body = %Q(---
large_image_size: 800
thumb_image_size: 128
web_icon_size: 32
company_logo_size: 128
company_banner_width: 400
company_banner_height: 60
company_sidebar_width: 200
company_sidebar_height: 400
)
    
    system_default.save!
      
    customer_default = DbFile.find_or_initialize_by_name("settings/customer.dflt")
    customer_default.body = %Q(---
company_name: Your Company Name
company_description: Your Company Description
welcome_text: Your Company Welcome
frame1_clr: "#6699cc"
frame1_txt_clr: "#333333"
frame2_clr: "#336699"
frame2_txt_clr: "#fefeef"
frame3_clr: "#FFFFFF"
frame3_txt_clr: "#00093a"
H1_clr: "#222266"
H2_clr: "#336699"	
H3_clr: "#6699cc"
dot_clr: "#6699cc"
background_clr: "#FFFFFF"
disabled_contacts: 0
disabled_news: 0
disabled_testimonials: 0
disabled_recommendations: 0
)

    customer_default.save!
    
  end
  
  def self.down
  end
end
