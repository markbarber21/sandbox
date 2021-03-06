class Admin::NewsController < ApplicationController
  
  before_filter :authorize
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @news_pages, @news = paginate :news, :order => "id DESC", :per_page => 10
  end

  def show
    @news = News.find(params[:id])
  end

  def new
    @news = News.new
    @image = Image.new
    @images = Image.find(:all)
  end

  def create    
   @news = News.new(params[:news])
   
    if(params[:image])
      @image = Image.new(params[:image])
      if (@image.save)
        @news.image_id = @image.id
      end
    end
    
    if @news.save
      flash[:notice] = 'News was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
    
  end

  def edit
    @news = News.find(params[:id])
    @images = Image.find(:all)
  end

  def update
    @news = News.find(params[:id])
    if @news.update_attributes(params[:news])
      flash[:notice] = 'News was successfully updated.'
      redirect_to :action => 'show', :id => @news
    else
      render :action => 'edit'
    end
  end

  def destroy
    News.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
