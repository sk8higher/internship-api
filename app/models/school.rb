class School < ApplicationRecord
  has_many :groups, through: :students
end
