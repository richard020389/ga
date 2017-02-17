# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mtype.all.each do |mtype|
  mtype.name   = "t"+mtype.id.to_s if   mtype.name ==nil || mtype.name ==""
  mtype.monstertype  = "human"  if  mtype.monstertype==nil || mtype.monstertype==""
  mtype.save
end

Monster.all.each do |monster|
    mtype = Mtype.find(monster.mtype_id)   
    return if mtype == nil
    monster.name  = mtype.name+"_"+monster.id.to_s if monster.name ==nil || monster.name ==""
    monster.monstertype  = mtype.monstertype if  monster.monstertype==nil || monster.monstertype==""
    monster.save
end


