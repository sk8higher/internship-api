# frozen_string_literal: true

10.times do |i|
  school = School.create!
  group = school.groups.new(number: i, letter: 'R', students_count: 20 + i)
  group.save

  20.times do |j|
    first_name = "Testname #{j}"
    last_name = "Testlastname #{j}"
    surname = "TestSurname #{j}"

    Student.create!(
      first_name:,
      last_name:,
      surname:,
      group_id: group.id,
      school_id: school.id
    )
  end
end
