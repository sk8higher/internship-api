# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.integer :number
      t.string :letter
      t.integer :students_count

      t.timestamps
    end
  end
end
