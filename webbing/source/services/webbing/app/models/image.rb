require 'rmagick'

class Image < ActiveRecord::Base
  validates_format_of :content_type, :with => /^image/, 
    :message => "-- you can only upload pictures"
  
  def uploaded_picture=(picture_field)
    if (picture_field.length != 0)
      self.content_type = picture_field.content_type.chomp
      image = Magick::Image.from_blob(picture_field.read).first
      #puts("image from_blob: #{image.inspect}")
    
      # to make sure the image is not too big
      large_size = Setting.value_of('large_image_size')
      large_image = image.change_geometry("#{large_size}x#{large_size}>") do |w, h, i|
        i.resize(w, h)
      end
      self.large = large_image.to_blob
    
      # create the thumbnail
      make_thumb(large_image)
    end
  end
  
  def rotate_clockwise()
    rotate(90)
  end
  
  def rotate_counter_clockwise()
    rotate(-90)
  end
  
  def rotate(angle)
    image = Magick::Image.from_blob(self.large).first
    image.rotate!(angle)
    self.large = image.to_blob
    make_thumb(image)
    save
  end
  
  def make_thumb(large_image)
      thumb_size = Setting.value_of('thumb_image_size')
      thumb_image = large_image.change_geometry("#{thumb_size}x#{thumb_size}>") do |w, h, i|
        i.resize(w, h)
      end
      self.thumb = thumb_image.to_blob
  end

end
