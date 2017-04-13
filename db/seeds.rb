# init mtype from sg13
require 'csv'
Mtype.destroy_all
#CSV.foreach('sgs.csv', headers:true,  encoding: "GBK") do |man|
CSV.foreach('sg.csv', headers:true,  encoding: "GBK") do |man|
  puts man["name"]+man["hp"]+man["atk"]+man["def"]+man["speed"]+man["all"]
  Mtype.create(name: man["name"],
            hp: man["hp"],
            atk: man["atk"],
            def: man["def"],
            speed: man["speed"],
            lvl: (man["all"].to_i-10)/2,
            monstertype: man["lancer"]+man["knight"]+man["bow"]
           )
end





## init user maxhp
#User.all.each do |user|
#  user.maxhp = user.hp if user.maxhp == nil
#  user.save
#end
#
## init mtype name/type 
#Mtype.all.each do |mtype|
#  mtype.name   = "t"+mtype.id.to_s if   mtype.name ==nil || mtype.name ==""
#  mtype.monstertype  = "human"  if  mtype.monstertype==nil || mtype.monstertype==""
#  mtype.save
#end
#
## init Monster
#Monster.all.each do |monster|
#    mtype = Mtype.find(monster.mtype_id)   
#    return if mtype == nil
#    monster.name  = mtype.name+"_"+monster.id.to_s if monster.name ==nil || monster.name ==""
#    monster.monstertype  = mtype.monstertype if  monster.monstertype==nil || monster.monstertype==""
#    monster.maxhp = monster.hp if monster.maxhp == nil
#    monster.save
#end


