class UserWordsController < ApplicationController

  def index
    @user_words = policy_scope(UserWord)
    #@word = policy_scope(Word)
    #@words = policy_scope(Word.all)
    #@user_word = User_word.all
  end

  def new
    @word = Word.find(params[:word_id])
    @user_word = UserWord.new
    authorize @user_word
  end
end
