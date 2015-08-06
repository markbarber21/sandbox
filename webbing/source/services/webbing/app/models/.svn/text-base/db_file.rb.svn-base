class DbFile < ActiveRecord::Base
  
  def self.exists(name)
    num_found = count(:conditions => ['name = ?', name])
    return num_found != 0
  end
  
end
