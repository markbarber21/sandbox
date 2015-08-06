class Admin::PortfolioController < ApplicationController
  before_filter :authorize
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @portfolio_entry_pages, @portfolio_entries = paginate :portfolio_entries, :order => "id DESC", :per_page => 30
  end

  def show
    @portfolio_entry = PortfolioEntry.find(params[:id])
  end

  def new
    @portfolio_entry = PortfolioEntry.new
    @image = Image.new
    @images = Image.find(:all)
    @service_entries = ServiceEntry.find(:all, :order => "title") 
  end

  def create        
    @portfolio_entry = PortfolioEntry.new(params[:portfolio_entry])
    
    if(params[:image])
      @image = Image.new(params[:image])
      if (@image.save)
        @portfolio_entry.image_id = @image.id
      end
    end    
        
    if @portfolio_entry.save
      flash[:notice] = 'PortfolioEntry was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @portfolio_entry = PortfolioEntry.find(params[:id])
    @images = Image.find(:all)
    @service_entries = ServiceEntry.find(:all, :order => "title") 
  end

  def update
    @portfolio_entry = PortfolioEntry.find(params[:id])
    if @portfolio_entry.update_attributes(params[:portfolio_entry])
      flash[:notice] = 'PortfolioEntry was successfully updated.'
      redirect_to :action => 'show', :id => @portfolio_entry
    else
      render :action => 'edit'
    end
  end

  def destroy
    PortfolioEntry.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
