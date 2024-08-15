class Student < ApplicationRecord
  belongs_to :group
  belongs_to :school
end
