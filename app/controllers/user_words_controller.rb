class UserWordsController < ApplicationController
  def new
    @word = Word.find(params[:word_id])
    @user_word = UserWord.new
    authorize @user_word
  end
end
