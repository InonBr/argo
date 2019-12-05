class QuizzesController < ApplicationController
  after_action :session_count, :question_counter_session, :right_answers_session, only: [:create]

  def session_count
    session[:counter] = 0
  end

  def question_counter_session
    session[:question_counter] = 0
  end

  def right_answers_session
    session[:right_questions_counter] = 0
  end

  def starter
    authorize Quiz
  end

  def create
    @quiz = Quiz.create(user: current_user, language: current_user.user_languages.find_by(active: true).language)
    authorize @quiz
    redirect_to questions_quiz_path(@quiz)
  end

  def questions
    @all_answers = []

    @quiz = Quiz.find(params[:id])
    authorize @quiz

    @question_number = question_counter
    @user_word = UserWord.current_language(current_user)
                         .where(user_words: { user: current_user, quizzed: false, removed: false, knew: true })
                         .order('RANDOM()').first

    @word = @user_word.word

    @answers = Word.order('RANDOM()').limit(3).pluck(:translation)
    @true_answer = @word.translation
    @all_answers << [@answers, @true_answer]
    @all_answers.flatten!.shuffle!
    @right_answers = @quiz.score
  end

  def answer

    @question = Word.find_by(original: params[:quiz_thing][:question])
    @user_answer = params[:quiz_thing][:answer]
    @quiz = Quiz.find(params[:id])
    authorize @quiz

    if @question.translation.strip == @user_answer.strip
       @quiz.score += 10
       @quiz.save
       @user_word = @question.user_words.find_by(user: current_user)
       @user_word.quizzed = true
       @user_word.save
       @right_answers = right_answers_counter
    end

    counter
  end

  def show
    @quiz = Quiz.find(params[:id])
    authorize @quiz
  end

  private

  def counter
   session[:counter] += 1
    if session[:counter] == 5
      redirect_to quiz_path(params[:id])
    else
      redirect_to questions_quiz_path(@quiz)
    end
  end

  def question_counter
    session[:question_counter] += 1
  end

  def right_answers_counter
    session[:right_questions_counter] += 1
  end
end
