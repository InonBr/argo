class UserWordsController < ApplicationController

  def index
    @user_words = policy_scope(UserWord)
    @word = params['word_id']
    unless params['search'].nil?
      search = params['search']

      # searches for both original and efintion for both languages,
      # might want to think about only searhching definiton when the language is german

      @user_words = current_user.user_words.select do |w|
        search.casecmp(w.word.original).zero? || w.word.translation.include?(search)
      end
    end
    #@words = policy_scope(Word.all)
    #@user_word = User_word.all
  end

  def new
    @word = Word.find(params[:word_id])
    @user_word = UserWord.new
    authorize @user_word
  end

  def create
    @user_word = UserWord.new(user_word_params)
    @user_word.quizzed = false
    @user_word.removed = false
    if @user_word.save
      redirect_to '/user_words'
    else
      render :new
    end
  end

  private

  def user_word_params
    params.require(:user_word).permit(:knew)
  end
end
