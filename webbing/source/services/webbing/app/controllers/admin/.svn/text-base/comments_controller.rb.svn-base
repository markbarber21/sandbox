class Admin::CommentsController < ApplicationController
  before_filter :authorize
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @comments_pages, @comments = paginate :comments, :order => "id DESC", :per_page => 10
  end

  def show
    @comments = Comments.find(params[:id])
  end

  def new
    @comments = Comments.new
  end

  def create
    @comments = Comments.new(params[:comments])
    if @comments.save
      flash[:notice] = 'Comments was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @comments = Comments.find(params[:id])
  end

  def update
    @comments = Comments.find(params[:id])
    if @comments.update_attributes(params[:comments])
      flash[:notice] = 'Comments was successfully updated.'
      redirect_to :action => 'show', :id => @comments
    else
      render :action => 'edit'
    end
  end

  def destroy
    Comments.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
  def approve
    @comments = Comments.find(params[:id])
    if (@comments.accepted > 0)
      @comments.accepted = 0  
    else
      @comments.accepted = 1
    end
    
    if @comments.save
      flash[:notice] = 'Comments was successfully Updated.'
      redirect_to :action => 'list'
    else
      flash[:notice] = 'Update Failed.'
      render :action => 'list'
    end
    
  end
end
