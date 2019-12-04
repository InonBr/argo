class UserLanguagesController < ApplicationController
  def update_languages
    @language = Language.find(params[:language_id])

    if current_user.languages.include?(@language)
      # make the user languge that he has active
      # and all others active = false
      chosen_user_language = current_user.user_languages.find_by(language: @language)
      chosen_user_language.active = true
      chosen_user_language.save
      authorize chosen_user_language
    else
      # create a new user language and make it active
      @user_language = UserLanguage.create(user: current_user, language: @language, active: true)
      authorize @user_language
    end

    other_languages = current_user.user_languages.where.not(language: @language)

    if other_languages
      other_languages.each do |l|
        l.active = false
        l.save
      end
    end

    redirect_to root_path
  end
end
