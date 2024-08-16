require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @school = School.create
    @group = @school.groups.create(number: 5, letter: 'Б', students_count: 32)
    @student = @group.students.create(
      first_name: 'Вячеслав',
      last_name: 'Абдурахмангаджиевич',
      surname: 'Мухобойников-Сыркин',
      school_id: @school.id,
      group_id: @group.id
    )
  end

  test "should get index" do
    get school_group_students_url(@school.id, @group.id)
    assert_response :success

    json_response = JSON.parse(response.body)
    assert_includes json_response['data'], {
      'id' => @student.id,
      'first_name' => @student.first_name,
      'last_name' => @student.last_name,
      'surname' => @student.surname,
      'group_id' => @student.group_id,
      'school_id' => @student.school_id
    }
  end

  test "should post create" do
    assert_difference 'Student.count', 1 do
      post students_url, params: { student: @student }, as: :json
    end

    assert_response :created
  end

  test "should delete student" do
    post students_url, params: { student: @student }, as: :json
    assert_response :success

    token = @response.headers['X-Auth-Token']
    student_id = JSON.parse(@response.body)['id']

    delete student_url(id: student_id), headers: { 'X-Auth-Token' => token }, as: :json

    assert_response :success
  end
end
