class JoinTableDogStroll < ApplicationRecord
  belongs_to :dog
  belongs_to :stroll
end