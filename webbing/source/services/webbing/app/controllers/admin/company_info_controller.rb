require 'rmagick'

class Admin::CompanyInfoController < ApplicationController
  before_filter :authorize
  
  def index
  end
  
  def information
  end
  
  def branding
    @branding_images = [
      { :file => Values::WebIconFile,
        :image => 'web_icon',
        :name => 'Web Icon',
        :remove => :remove_web_icon,
        :upload => :uploaded_web_icon,
      },
      {
        :file => Values::LogoImageFile,
        :image => 'logo_image',
        :name => 'Logo Image',
        :remove => :remove_logo_image,
        :upload => :uploaded_logo_image,
      },
      {
        :file => Values::BannerImageFile,
        :image => 'banner_image',
        :name => "Banner Image",
        :remove => :remove_banner_image,
        :upload => :uploaded_banner_image,
      },
      {
        :file => Values::SidebarImageFile,
        :image => 'sidebar_image',
        :name => 'Sidebar Image',
        :remove => :remove_sidebar_image,
        :upload => :uploaded_sidebar_image,
      }]
  end    
  
  def coloring
  end
  
  def section_settings
  end  
  
  def update_information
    @customer_props[:company_name] = params[:company_name]
    @customer_props[:company_description] = params[:company_description]
    @customer_props[:welcome_text] = params[:welcome_text]
    @customer_props.save!
        
    flash[:notice] = 'Company Information updated.'
    redirect_to :action => 'information'
  end
  
  def update_branding  
    destroy_image_file(:remove_web_icon, Values::WebIconFile)
    destroy_image_file(:remove_logo_image, Values::LogoImageFile)
    destroy_image_file(:remove_banner_image, Values::BannerImageFile)
    destroy_image_file(:remove_sidebar_image, Values::SidebarImageFile)
    
    save_image_file(:uploaded_web_icon, Values::WebIconFile, @system_props[:web_icon_size], @system_props[:web_icon_size], 'png')
    save_image_file(:uploaded_logo_image, Values::LogoImageFile, @system_props[:company_logo_size], @system_props[:company_logo_size], 'jpg')
    save_image_file(:uploaded_banner_image, Values::BannerImageFile, @system_props[:company_banner_width], @system_props[:company_banner_height], 'jpg')
    save_image_file(:uploaded_sidebar_image, Values::SidebarImageFile, @system_props[:company_sidebar_width], @system_props[:company_sidebar_height], 'jpg')
    
    flash[:notice] = 'Branding updated.'
    redirect_to :action => 'branding'
  end
  
  def update_coloring
    @customer_props[:background_clr]  = params[:background_clr]    
    @customer_props[:frame1_clr]      = params[:frame1_clr]
    @customer_props[:frame1_txt_clr]  = params[:frame1_txt_clr]
    @customer_props[:frame2_clr]      = params[:frame2_clr]
    @customer_props[:frame2_txt_clr]  = params[:frame2_txt_clr]
    @customer_props[:frame3_clr]      = params[:frame3_clr]
    @customer_props[:frame3_txt_clr]  = params[:frame3_txt_clr]
    @customer_props[:H1_clr]        = params[:H1_clr]
    @customer_props[:H2_clr]        = params[:H2_clr]
    @customer_props[:H3_clr]        = params[:H3_clr]
    @customer_props[:dot_clr]       = params[:dot_clr]
    @customer_props.save!
        
    flash[:notice] = 'Coloring updated.'
    redirect_to :action => 'coloring'    
  end
  
  def update_section_settings
    @customer_props[:disabled_contacts]             = params[:disabled_contacts]
    @customer_props[:disabled_news]                 = params[:disabled_news]
    @customer_props[:disabled_testimonials]         = params[:disabled_testimonials]
    @customer_props[:disabled_recommendations]      = params[:disabled_recommendations]

    @customer_props.save!  
    
    flash[:notice] = 'Section Settings updated.'
    redirect_to :action => 'section_settings'  
  end
  
  
  def save_image_file(param_name, file_name, width, height, format)
    image_data = params[param_name]
    return if image_data.instance_of? String

    image = resized_image(image_data, width, height)
    return if not image

    file = DbFile.find_or_create_by_name(file_name)
    file.body = image.to_blob { |i| i.format = format }
    file.save!
  end
  
  def resized_image(image_field, width, height)
    image_list = Magick::Image.from_blob(image_field.read)
    image = image_list.first
    image.resize!(width.to_i, height.to_i)
    return image
  end
  
  def destroy_image_file(param_name, file_name)
    param = params[param_name]
    if param and param != 0
      DbFile.destroy_all ['name = ?', file_name]
    end
  end
end
