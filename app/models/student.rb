class Student < ApplicationRecord
  belongs_to :group
  belongs_to :school

  attr_readonly :id

  validates :first_name, :last_name, :surname, :class_id, :school_id, presence: true
end
