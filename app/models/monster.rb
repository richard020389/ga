class Monster < ApplicationRecord
  belongs_to :map, optional: true
  belongs_to :mtype, optional: true
  
end
