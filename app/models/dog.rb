class Dog < ApplicationRecord
  belongs_to :city, optional: true
  has_many :strolls
  has_many :dogsitters, through: :strolls
end
