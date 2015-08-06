class Admin::RecommendationController < ApplicationController
  before_filter :authorize
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @recommendations_pages, @recommendations = paginate :recommendations, :per_page => 10
  end

  def show
    @recommendations = Recommendations.find(params[:id])
  end

  def new
    @recommendations = Recommendations.new
    @image = Image.new
    @images = Image.find(:all)
  end

  def create
    @recommendations = Recommendations.new(params[:recommendations])
    
    if(params[:image])
      @image = Image.new(params[:image])
      if (@image.save)
        @recommendations.image_id = @image.id
      end
    end
        
    if @recommendations.save
      flash[:notice] = 'Recommendations was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @recommendations = Recommendations.find(params[:id])
    @images = Image.find(:all)
  end

  def update
    @recommendations = Recommendations.find(params[:id])
    if @recommendations.update_attributes(params[:recommendations])
      flash[:notice] = 'Recommendations was successfully updated.'
      redirect_to :action => 'show', :id => @recommendations
    else
      render :action => 'edit'
    end
  end

  def destroy
    Recommendations.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
