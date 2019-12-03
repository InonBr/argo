class UserLanguagesController < ApplicationController

 before_action :authenticate_user!
  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def update_languages
    #@languages = policy_scope(Language)
    @language = Language.find(params[:language_id])
     @languages = policy_scope(Language)
     authorize @language

    if current_user.languages.include?(@language)
      # make the user languge that he has active
      # and all others active = false
      chosen_user_language = current_user.user_languages.find_by(language: @language)
      chosen_user_language.active = true
      chosen_user_language.save
    else
      # create a new user language and make it active
      UserLanguage.create(user: current_user, language: @language, active: true)
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
