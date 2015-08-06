class Comment < ActiveRecord::Base
  
  def before_create 
    self.when_created = Date.today
    self.accepted = 0    
  end
    
end
