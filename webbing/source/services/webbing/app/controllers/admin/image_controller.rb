class Admin::ImageController < ApplicationController
  before_filter :authorize

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @image_pages, @images = paginate :images, :order => "id DESC", :per_page => 10
  end
  
  def thumbnail_id_list
    @image_pages, @images = paginate :images, :order => "id DESC", :per_page => 100
  end

  def show
    @image = Image.find(params[:id])
    # caching disabled on admin images for now so users can edit them and see the updates
    #enable_caching
    send_data(@image.large, :type => @image.content_type, :disposition => "inline")
  end
  
  def thumb
    @image = Image.find(params[:id])
    # caching disabled on admin images for now so users can edit them and see the updates
    #enable_caching
    send_data(@image.thumb, :type =>@image.content_type, :disposition => "inline")
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params[:image])
    if @image.save
      flash[:notice] = 'Image was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(params[:image])
      flash[:notice] = 'Image was successfully updated.'
      redirect_to :action => 'edit', :id => @image
    else
      render :action => 'edit'
    end
  end
  
  def rotate_clockwise
    @image = Image.find(params[:id])
    @image.rotate_clockwise
    flash[:notice] = 'Image rotated clockwise'
    redirect_to :action => 'edit', :id => params[:id]
  end

  def rotate_counter_clockwise
    @image = Image.find(params[:id])
    @image.rotate_counter_clockwise
    flash[:notice] = 'Image rotated counter-clockwise'
    redirect_to :action => 'edit', :id => params[:id]
  end

  def destroy
    Image.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def web_icon
    send_image(Values::WebIconFile, 'png', false)
  end
  
  def logo_image
    send_image(Values::LogoImageFile, 'jpg', false)
  end
  
  def banner_image
    send_image(Values::BannerImageFile, 'jpg', false)
  end
  
  def sidebar_image
    send_image(Values::SidebarImageFile, 'jpg', false)
  end

end
