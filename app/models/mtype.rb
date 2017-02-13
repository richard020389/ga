class Mtype < ApplicationRecord
  has_many :monsters,:dependent => :destroy
  has_many :map_mtypeships,:dependent => :destroy
  has_many :maps, through: :map_mtypeships
end
