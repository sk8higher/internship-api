# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :students

  attr_readonly :id, :students_count

  validates :number, :letter, :students_count, presence: true
end
