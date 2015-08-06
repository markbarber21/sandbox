class Admin::TestimonialController < ApplicationController
  before_filter :authorize
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @testimonial_entry_pages, @testimonial_entries = paginate :testimonial_entries, :per_page => 10
  end

  def show
    @testimonial_entry = TestimonialEntry.find(params[:id])
  end

  def new
    @testimonial_entry = TestimonialEntry.new
  end

  def create
    @testimonial_entry = TestimonialEntry.new(params[:testimonial_entry])
    if @testimonial_entry.save
      flash[:notice] = 'TestimonialEntry was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @testimonial_entry = TestimonialEntry.find(params[:id])
  end

  def update
    @testimonial_entry = TestimonialEntry.find(params[:id])
    if @testimonial_entry.update_attributes(params[:testimonial_entry])
      flash[:notice] = 'TestimonialEntry was successfully updated.'
      redirect_to :action => 'show', :id => @testimonial_entry
    else
      render :action => 'edit'
    end
  end

  def destroy
    TestimonialEntry.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
