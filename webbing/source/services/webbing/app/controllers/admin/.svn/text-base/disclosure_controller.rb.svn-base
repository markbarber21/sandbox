class Admin::DisclosureController < ApplicationController
  before_filter :authorize
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @disclosures_pages, @disclosures = paginate :disclosures, :per_page => 10
  end

  def show
    @disclosures = Disclosures.find(params[:id])
  end

  def new
    @disclosures = Disclosures.new
  end

  def create
    @disclosures = Disclosures.new(params[:disclosures])
    if @disclosures.save
      flash[:notice] = 'Disclosures was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @disclosures = Disclosures.find(params[:id])
  end

  def update
    @disclosures = Disclosures.find(params[:id])
    if @disclosures.update_attributes(params[:disclosures])
      flash[:notice] = 'Disclosures was successfully updated.'
      redirect_to :action => 'show', :id => @disclosures
    else
      render :action => 'edit'
    end
  end

  def destroy
    Disclosures.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
