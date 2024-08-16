# frozen_string_literal: true

require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    @school = School.create
    @group = @school.groups.create(number: 5, letter: 'Б', students_count: 32)

    get school_groups_url(@school.id)
    assert_response :success

    json_response = JSON.parse(response.body)
    assert_includes json_response['data'], {
      'id' => @group.id,
      'number' => @group.number,
      'letter' => @group.letter,
      'students_count' => @group.students_count
    }
  end
end
