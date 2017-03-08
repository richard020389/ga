class User < ApplicationRecord
  after_initialize :default_values
  validates_uniqueness_of :name
  User_init_point = 5
  attr_accessor :trig
private
  def default_values
    ## not init if have value
    if self.id
      return
    end
    @name  = ""   
    self.atk   = 1    
    self.def   = 1    
    self.speed   = 1    
    self.maxhp    = 5   
    self.hp    =  self.maxhp   
    self.ap    = 10    
    self.exp   = 0    
    self.lvl   = 1    
    User_init_point.times do |p|
      r= rand(0..3)
      if r == 0
        self.atk += 1
      elsif r == 1
        self.def += 1
      elsif r == 2
        self.hp += 1
      elsif r == 3
        self.speed += 1
      end
    end
    self.trig = 0
  end
end
