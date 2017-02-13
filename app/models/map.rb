class Map < ApplicationRecord
  has_many :monsters,:dependent => :destroy
  has_many :map_mtypeships,:dependent => :destroy
  has_many :mtypes, through: :map_mtypeships
  def create_monster
    @mtypes = Mtypes
  end
end
