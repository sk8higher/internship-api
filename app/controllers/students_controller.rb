# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    @students = School.find(params[:school_id]).groups.find(params[:group_id]).students

    render json: { data: @students.as_json(except: %i[created_at updated_at]) }
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      response.headers['X-Auth-Token'] = generate_access_token(@student)
      render json: @student, status: 201
    else
      render json: @student.errors.full_messages, status: 405
    end
  end

  def destroy
    token = request.headers['X-Auth-Token']

    decoded_token = decode_jwt(token)
    student_id = decoded_token['student']['id']

    @student = Student.find_by(id: student_id)

    if @student.present? && student_id == params[:id].to_i
      @student.destroy
      head 204
    else
      render json: { error: 'Incorrect Student id.' }, status: 400
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :surname, :group_id, :school_id)
  end

  def generate_access_token(student)
    JWT.encode(payload(student.id), ENV['JWT_SECRET'], 'HS512')
  end

  def payload(student_id)
    {
      exp: Time.now.to_i + 60 * 360,
      iat: Time.now.to_i,
      iss: ENV['JWT_ISSUER'],
      student: { id: student_id }
    }
  end

  def decode_jwt(token)
    options = { algorithm: 'HS512', iss: ENV['JWT_ISSUER'] }
    JWT.decode(token, ENV['JWT_SECRET'], true, options)[0]
  rescue JWT::DecodeError
    render json: { error: 'A token must be passed.' }, status: 401
  rescue JWT::ExpiredSignature
    render json: { error: 'The token has expired.' }, status: 403
  rescue JWT::InvalidIssuerError
    render json: { error: 'The token does not have a valid issuer.' }, status: 403
  rescue JWT::InvalidIatError
    render json: { error: 'The token does not have a valid "issued at" time.' }, status: 403
  end
end
