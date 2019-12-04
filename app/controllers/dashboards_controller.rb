class DashboardsController < ApplicationController
  def profile
    @user = current_user
  end
end
