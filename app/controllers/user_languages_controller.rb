class UserLanguagesController < ApplicationController
  def show
    unless params['id'] == '#'
    @user_language = UserLanguage.find(params['id'])
    authorize @user_language
    end
    @random_word_in_user_language = Word.random_unseen(current_user)
    @can_take_quiz = UserWord.where(user: current_user, quizzed: false, removed: false, knew: true).count >= 5
  end

  def update_languages
    #@languages = policy_scope(Language)
    @language = Language.find(params[:language_id])
    @languages = policy_scope(Language)
    authorize @language

    if current_user.languages.include?(@language)
      # make the user languge that he has active
      # and all others active = false
       @user_language = current_user.user_languages.find_by(language: @language)
       @user_language.active = true
       @user_language.save
      authorize  @user_language
    else
      # create a new user language and make it active
      chosen_user_language = UserLanguage.create(user: current_user, language: @language, active: true)
      @user_language = chosen_user_language
      authorize chosen_user_language
    end

    other_languages = current_user.user_languages.where.not(language: @language)

    if other_languages
      other_languages.each do |l|
        l.active = false
        l.save
      end
    end
    redirect_to user_language_path( @user_language)
  end
end
