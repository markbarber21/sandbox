class Setting < ActiveRecord::Base
  
  def self.value_of(name)
    Setting.find_by_name(name).value
  end
  
end
