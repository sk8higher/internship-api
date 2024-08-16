# frozen_string_literal: true

class Student < ApplicationRecord
  belongs_to :group
  belongs_to :school

  attr_readonly :id

  validates :first_name, :last_name, :surname, :group_id, :school_id, presence: true

  def generate_access_token
    JWT.encode(payload, ENV['JWT_SECRET'], 'HS512')
  end

  def payload
    {
      exp: Time.now.to_i + 60 * 360,
      iat: Time.now.to_i,
      iss: ENV['JWT_ISSUER'],
      student: { id: }
    }
  end
end
