class WelcomeController < ApplicationController
  
  def index
    redirect_to(:controller => "services", :action => "index")   
  end
  
end
