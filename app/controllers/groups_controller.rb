class GroupsController < ApplicationController
  def index
    @groups = School.find(params[:school_id]).groups

    render json: { data: @groups.as_json(only: %i[id number letter students_count]) }
  end
end
