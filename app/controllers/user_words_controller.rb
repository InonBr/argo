class UserWordsController < ApplicationController

  def index
    @dropdown_languages = Language.joins(:user_languages).where(user_languages: { user: current_user })
    @user_words = policy_scope(UserWord).where(removed: false, user: current_user)
    # @word = params['word_id']
    #search bar
    unless params['search'].nil?
      search = params['search']
      language = Language.find_by(name: params['language'])

      @user_words = UserWord.joins(:word).where(user_words: { user: current_user, removed: false }, words_user_words: { language_id: language.id }).search_original_and_translation(search)
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
  end

  private

  def user_word_params
    params.require(:user_word).permit(:knew, :removed)
  end
end
