class LanguagesController < ApplicationController

  def index
    @languages = policy_scope(Language)

  end

  def show
    @language = Language.find(params[:id])
    authorize @language
  end
end
