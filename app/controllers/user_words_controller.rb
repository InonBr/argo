class UserWordsController < ApplicationController
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
