class ServicesController < ApplicationController

  # Welcome/Services
  def index 
      @service_entries = ServiceEntry.find(:all)
  end
  
  def services 
      @service_entry_pages, @service_entries = paginate :service_entries, :order => "sort_order DESC", :per_page => 50
  end  
  
  def contact
      @contact_pages, @contact = paginate :contact, :order => "id DESC", :per_page => 10
  end  

  def about

  end
  
  def examples
    @service_entries = ServiceEntry.find(:all)
  end  
  
  def service
    @service_entry = ServiceEntry.find(params[:id])
    @service_entries = ServiceEntry.find(:all, :conditions => "id != #{params[:id]}", :order => "sort_order DESC")
    render :action => "service", :layout => "services"
  end  
  
  def testimonials

  end
  
  def links
      @recommendations_pages, @recommendations = paginate :recommendations, :per_page => 50
  end

  def news
      @news_pages, @news = paginate :news, :order => "id DESC", :per_page => 5
  end
  
  def news_archive
      @news = News.find(:all, :order => "id DESC")
  end  
  
  def news_rss
    @news = News.find(:all, :limit =>10, :order => "id DESC")
    # render_without_layout
    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end
  
  def read_news
    @news = News.find(params[:id])
  end  
  
  def comment
    @news = News.find(params[:id])
    @comment = Comment.new
  end
  
  def create_comment    
   @comment = Comment.new(params[:comment])
   # @comment.news_id = params[:comment][:news_id].to_i()
      
    if @comment.save
      
      Postoffice.deliver_comment_posted(@comment.who, @comment.body, request.remote_ip)
      
      flash[:notice] = 'Comment was posted, please wait for review. Originating IP:' + request.remote_ip
      redirect_to :action => 'news'
    else
      redirect_to :action => 'news'
    end
  end  
  
  def image
    @image = Image.find(params[:id])
    enable_caching
    send_data(@image.large, :type => @image.content_type, :disposition => "inline")
  end
  
  def thumb
    @image = Image.find(params[:id])
    enable_caching
    send_data(@image.thumb, :type => @image.content_type, :disposition => "inline")
  end
  
  def web_icon
    send_image(Values::WebIconFile, 'png', true)
  end
  
  def logo_image
    send_image(Values::LogoImageFile, 'jpg', true)
  end
  
  def banner_image
    send_image(Values::BannerImageFile, 'jpg', true)
  end
  
  def sidebar_image
    send_image(Values::SidebarImageFile, 'jpg', true)
  end

end

# //TODO:

#* Custom HTML pages
#  - Nav Link
#  - Service page replacement (or just add an optional (body) field in services.

#* Image pick list

