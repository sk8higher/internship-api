class School < ApplicationRecord
  has_many :students
  has_many :groups, through: :students
end
