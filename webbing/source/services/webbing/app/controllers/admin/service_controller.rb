class Admin::ServiceController < ApplicationController
  before_filter :authorize
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @service_entry_pages, @service_entries = paginate :service_entries, :order => "sort_order DESC", :per_page => 10
  end

  def show
    @service_entry = ServiceEntry.find(params[:id])
  end

  def new
    @service_entry = ServiceEntry.new
    @image = Image.new
    @images = Image.find(:all)
  end

  def create
    @service_entry = ServiceEntry.new(params[:service_entry])
    
    if(params[:image])
      @image = Image.new(params[:image])
      if (@image.save)
        @service_entry.image_id = @image.id
      end
    end
      
    if @service_entry.save  
      flash[:notice] = 'ServiceEntry was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @service_entry = ServiceEntry.find(params[:id])
    @images = Image.find(:all)
  end

  def update
    @service_entry = ServiceEntry.find(params[:id])
    if @service_entry.update_attributes(params[:service_entry])
      flash[:notice] = 'ServiceEntry was successfully updated.'
      redirect_to :action => 'show', :id => @service_entry
    else
      render :action => 'edit'
    end
  end

  def destroy
    ServiceEntry.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
