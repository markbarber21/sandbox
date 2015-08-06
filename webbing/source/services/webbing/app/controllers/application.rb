# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_webbing_session_id'
  
  def initialize()
    super()
    @customer_props = Properties.get(Values::CustomerSettingsFile)
    @system_props = Properties.get(Values::SystemSettingsFile)
  end 
   
   private 
  
  def authorize 
    unless User.find_by_id(session[:user_id]) 
      session[:original_uri] = request.request_uri
      flash[:notice] = "Please log in" 
      redirect_to(:controller => "login", :action => "login") 
    end 
  end 
  
  def enable_caching
    headers["Cache-Control"] = "max-age=3000000" # a bit over a month seems reasonable
  end
  
  def send_image(file_name, short_type, cached)
    file = DbFile.find_by_name(file_name)
    enable_caching if cached
    short_type = "jpeg" if short_type == "jpg"
    type = "image/#{short_type}"
    send_data(file.body, :type => type, :disposition => 'inline')
  end
  
  def method_missing(name, *args) 
    render(:inline => %{ 
    <h2>Unknown action21: #{name}</h2> 
    Here are the request parameters:<br/> 
    <%= debug(params) %> }) 
  end
  
end
