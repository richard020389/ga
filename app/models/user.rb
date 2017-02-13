class User < ApplicationRecord
  after_initialize :default_values
  validates_uniqueness_of :name
private
  def default_values
    @name  = ""   
    self.atk   = 1    
    self.def   = 1    
    self.hp    = 10    
    self.ap    = 10    
    self.exp   = 0    
    self.lvl   = 1    
  end
end
