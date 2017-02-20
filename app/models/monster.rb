class Monster < ApplicationRecord
  after_initialize :default_values
  belongs_to :map, optional: true
  belongs_to :mtype, optional: true
  
  validates_presence_of :mtype_id
  private
  def default_values
    mtype = Mtype.find(self.mtype_id)   
    return if mtype == nil
    self.name         ||= mtype.name+"_"
    self.monstertype  ||= mtype.monstertype
    self.atk          ||= randpara mtype.atk  
    self.def          ||= randpara mtype.def    
    self.hp           ||= randpara mtype.hp    
    self.exp          ||= randpara mtype.exp    
    self.lvl          ||= mtype.lvl    
  end
end
