class DashboardsController < ApplicationController
  def profile
    @user = current_user
    @scores = {}
    @user.quizzes.each do |quiz|
      @scores[quiz.language.name] = ((@scores[quiz.language.name] || 0) + quiz.score)
      @scores["total_study_time"] = @scores["total_study_time"] || 0 + (quiz.updated_at - quiz.created_at)
    end
    @scores["total_points"] = @user.quizzes.map {|quiz| quiz.score}.sum

  end
end
