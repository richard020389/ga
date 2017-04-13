require 'csv'
res = Array.new
CSV.foreach('sgs.csv', headers:true,  encoding: "GBK") do |man|
  puts man["name"]+man["hp"]+man["atk"]+man["def"]+man["speed"]+man["all"]
end


