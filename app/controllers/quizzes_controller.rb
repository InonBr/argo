class QuizzesController < ApplicationController
  after_action :reset_counters, only: [:create]

  def starter
    authorize Quiz
  end

  def create
    @quiz = Quiz.create(user: current_user, language: current_user.user_languages.find_by(active: true).language)
    authorize @quiz
    redirect_to questions_quiz_path(@quiz)
  end

  def questions
    # raise
    @all_answers = []

    @quiz = Quiz.find(params[:id])
    authorize @quiz

    increase_question_counter
    @question_number = question_counter
    @user_word = generate_question
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

    # Correct answer!
    if @question.translation.strip == @user_answer.strip
       @quiz.score += 10
       @quiz.save
       @user_word = @question.user_words.find_by(user: current_user)
       @user_word.quizzed = true
       @user_word.save
       increase_right_answers_counter
       @right_answers = right_answers_counter
    end

    counter
  end

  def show
    @quiz = Quiz.find(params[:id])
    authorize @quiz
  end

  private

  # Find a new UserWord to ask
  # Store it in the session
  def generate_question
    user_word = nil
    while user_word.nil?
      uw = UserWord.current_language(current_user)
                    .where(user_words: { user: current_user, quizzed: false, removed: false, knew: true })
                    .sample
      if quiz_user_words.include? uw.id
      end
      user_word = uw unless quiz_user_words.include? uw.id
    end
    # We have found a word
    add_quiz_user_word(user_word)
    user_word
  end

  def reset_counters
    # count of
    session[:counter] = 0
    # How many questions has the user been asked
    session[:question_counter] = 0
    # How many questions the user has answered correctly
    session[:right_questions_counter] = 0
    # User words in session
    session[:user_words] = []
  end

  def counter
   session[:counter] += 1
    if session[:counter] == 5
      redirect_to quiz_path(params[:id])
    else
      redirect_to questions_quiz_path(@quiz)
    end
  end

  def increase_question_counter
    session[:question_counter] += 1
  end

  def question_counter
    session[:question_counter]
  end

  def increase_right_answers_counter
    session[:right_questions_counter] += 1
  end

  def right_answers_counter
    session[:right_questions_counter]
  end

  def add_quiz_user_word(user_word)
    session[:user_words] << user_word.id
  end

  def quiz_user_words
    session[:user_words]
  end
end
