require 'rmagick'

class CompanyInfo < ActiveRecord::Base
  def self.get()
    return find(:first)
  end
  
  def uploaded_web_icon=(image_field)
    size = Setting.value_of('web_icon_size')
    image = resized_image(image_field, size, size)
    self.web_icon = image.to_blob do |i|
      i.format = 'png'
    end if image
  end
  
  def uploaded_logo_image=(image_field)
    size = Setting.value_of('company_logo_size')
    image = resized_image(image_field, size, size)
    self.logo_image = image.to_blob do |i|
      i.format = 'jpg'
    end if image
  end
  
  def uploaded_banner_image=(image_field)
    width = Setting.value_of('company_banner_width')
    height = Setting.value_of('company_banner_height')
    image = resized_image(image_field, width, height)
    self.banner_image = image.to_blob do |i|
      i.format = 'jpg'
    end if image
  end
  
  def uploaded_sidebar_image=(image_field)
    width = Setting.value_of('company_sidebar_width')
    height = Setting.value_of('company_sidebar_height')
    image = resized_image(image_field, width, height)
    self.sidebar_image = image.to_blob do |i|
      i.format = 'jpg'
    end if image
  end
  
  
  def resized_image(image_field, width, height)
    return nil if image_field.instance_of? String
    image_list = Magick::Image.from_blob(image_field.read)
    image = image_list.first
    image.resize!(width.to_i, height.to_i)
    return image
  end
  
end
