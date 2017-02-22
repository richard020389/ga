class User < ApplicationRecord
  after_initialize :default_values
  validates_uniqueness_of :name
  User_init_point = 5
private
  def default_values
    ## not init if have value
    if self.atk && self.def && self.hp   
      puts "skip init"
      return
    end
    pp self
    @name  = ""   
    self.atk   = 1    
    self.def   = 1    
    self.hp    = 5   
    self.ap    = 10    
    self.exp   = 0    
    self.lvl   = 1    
    User_init_point.times do |p|
      r= rand(0..2)
      if r == 0
        self.atk += 1
      elsif r == 1
        self.def += 1
      elsif r == 2
        self.hp += 1
      end
    end

  end
end
