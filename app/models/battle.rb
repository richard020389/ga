class Battle < ApplicationRecord
  belongs_to :user, optional: true
  has_many :battlelines,:dependent => :destroy
end
