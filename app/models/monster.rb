class Monster < ApplicationRecord
  after_initialize :default_values
  belongs_to :map, optional: true
  belongs_to :mtype, optional: true
  
  validates_presence_of :mtype_id
  Monster_init_point = 5
  attr_accessor :trig
  private
  def default_values
    ## not init if have value
    if self.id
      return
    end
    mtype = Mtype.find(self.mtype_id)   
    return if mtype == nil
    self.name         ||= mtype.name+"_"
    self.monstertype  ||= mtype.monstertype
    self.atk          ||= randpara mtype.atk  
    self.def          ||= randpara mtype.def    
    self.speed        ||= randpara mtype.speed    
    self.maxhp        ||= randpara mtype.hp    
    self.hp           ||= randpara mtype.hp    
    self.exp          ||= randpara mtype.exp    
    self.lvl          ||= mtype.lvl    
    self.trig = 0
  end
end
