class UserWordsController < ApplicationController

  def index

    @user_words = policy_scope(UserWord).where(removed: false)
    # @word = params['word_id']

    unless params['search'].nil?
      search = params['search']
      language = params['language']
                # my_words IS A METHOD IN THE USER MODEL
      @user_words = UserWord.current_language(current_user).where(removed: false).select do |w|
        if language == 'English'
          search.casecmp(w.word.original).zero? || w.word.translation.include?(search)
        else
          w.word.translation.downcase.include?(search.downcase)
        end
      end
    end
  end

  def new
    unless params[:word_id].match?(/^#/)
      @word = Word.find(params[:word_id])
    else
      @out_of_words = true
    end
    @user_word = UserWord.new
    authorize @user_word
  end

  def create
    @word = Word.find(params[:word_id])
    @user_word = UserWord.find_by(user: current_user, word: @word)

    if @user_word
      @user_word.update(user_word_params)
      authorize @user_word
    else
      @user_word = UserWord.new(user_word_params)
      @user_word.quizzed = false
      @user_word.user = current_user
      @user_word.word = @word
      authorize @user_word
      @user_word.save
    end

    random_unknown_user_word = UserWord.current_language(current_user).where(knew: false).order('RANDOM()').first
    random_unknown_word = random_unknown_user_word.nil? ? nil : random_unknown_user_word.word
    next_word = [Word.random_unseen(current_user), random_unknown_word].compact.flatten
    next_word.empty? ? (redirect_to new_word_user_word_path('#')) : (redirect_to new_word_user_word_path(next_word.sample))
  end

  def destroy
    @user_word = UserWord.find(params[:id])
    authorize @user_word
    @user_word.destroy
    redirect_to user_words_path
  end

  private

  def user_word_params
    params.require(:user_word).permit(:knew, :removed)
  end
end
