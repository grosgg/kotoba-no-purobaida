class QuizzesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_quiz, only: [:show, :update]

  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = Quiz.where(:user => current_user).desc(:_id)
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
  end
  
  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.user = current_user
    @quiz.generate_questions

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz }
        format.json { render action: 'show', status: :created, location: @quiz }
      else
        format.html { render action: 'new' }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.json { head :no_content }
      else
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(:score, :questions_count)
    end
end
