class QuestionsController < ApplicationController

  before_action :get_question, only: [:update, :destroy]

  def index
    questions = Question.all
    render json: questions.to_json( :include => [:mapping, :role] ), status: 200
  end

  def create
    question = Question.create(question_params)
    render json: question.to_json(:include => {:mapping => {:only => [:mapping_name]}, :role => {:only => [:name]} }), status: 200
  end

  def update
    @question.update(question_params)
    render json: question.to_json, status: 200
  end

  def destroy
    @question.destroy
    render json: {message: 'Question is destroy successfully'}, status: 200
  end

  def mapping_list
    mappings = Mapping.all
    render json: mappings.to_json, status: 200
  end

  def role_list
    roles = Role.all
    render json: roles.to_json, status: 200
  end


  private

  def get_question
    @question = Question.find_by(id: params[:id])
  end

  def question_params
    params.require(:question).permit(:role_id, :mapping_id, :question_type, :is_required, :team_stage, :appear, :conditions, :frequency, :question)
  end
end
