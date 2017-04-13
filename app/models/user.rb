class User < ApplicationRecord
  after_initialize :default_values
  validates_uniqueness_of :name
  has_many :battles,:dependent => :destroy
  User_init_point = 10
  User_lvl_point = 2
  User_lvl_exp = 2000
  attr_accessor :trig
  def lvl_up
    if self.exp >= User_lvl_exp
      self.exp -= User_lvl_exp 
      self.lvl += 1
      add_point User_lvl_point
    end
  end
private
  def default_values
    ## not init if have value
    if self.id
      return
    end
    @name  = ""   
    self.atk   = 1    
    self.def   = 1    
    self.speed = 1    
    self.maxhp = 5   
    self.hp    =  self.maxhp   
    self.ap    = 10    
    self.exp   = 0    
    self.lvl   = 1    
    add_point User_init_point - 8
    self.trig = 0
  end
  def add_point(point)
    message=""
    point.times do |p|
      r= rand(0..3)
      if r == 0
        self.atk += 1
        message+="atk+1\n"
      elsif r == 1
        self.def += 1
        message+="def+1\n"
      elsif r == 2
        self.maxhp += 1
        message+="maxhp+1\n"
      elsif r == 3
        self.speed += 1
        message+="speed+1\n"
      end
    end
    message
  end
end
