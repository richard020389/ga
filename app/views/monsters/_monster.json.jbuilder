json.extract! monster, :id, :name, :type, :atk, :def, :hp, :exp, :lvl, :created_at, :updated_at
json.url monster_url(monster, format: :json)