class Mtype < ApplicationRecord
  after_initialize :default_values
  has_many :monsters,:dependent => :destroy
  has_many :map_mtypeships,:dependent => :destroy
  has_many :maps, through: :map_mtypeships

  private
  def default_values
    ## not init if have value
    if self.id
      return
    end
    self.name   ||= "t"+ self.id.to_s  
    self.monstertype   ||= "human"  
    self.atk   ||= 1  
    self.def   ||= 1  
    self.hp    ||= 1 
    self.exp   ||= 1  
    self.lvl   ||= 1  
  end
end
