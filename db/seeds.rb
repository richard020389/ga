User.all.each do |user|
  user.maxhp = user.hp if user.maxhp == nil
  user.save
end

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
    monster.maxhp = monster.hp if monster.maxhp == nil
    monster.save
end


