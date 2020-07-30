class Dogsitter < ApplicationRecord
  belongs_to :city, optional: true
  has_many :strolls
  has_many :dogs, through: :strolls
end
