class UserWordsController < ApplicationController

  def index
    @user_words = policy_scope(UserWord)
    @word = params['word_id']
    unless params['search'].nil?
      search = params['search']

      # searches for both original and efintion for both languages,
      # might want to think about only searhching definiton when the language is german
      Word.first
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
    @word = Word.find(params[:word_id])

    @user_word = UserWord.new(user_word_params)
    @user_word.quizzed = false
    @user_word.removed = false
    @user_word.user = current_user
    @user_word.word = @word
    authorize @user_word
    @user_word.save

    next_word = [Word.random_unseen(current_user), UserWord.where(knew: false).order('RANDOM()').first].sample

    redirect_to new_word_user_word_path(next_word)
  end

  private

  def user_word_params
    params.require(:user_word).permit(:knew)
  end
end
