 class DashboardsController < ApplicationController
  def profile
    @user = current_user
    @scores = {}
    @totals = {}
    @user.quizzes.each do |quiz|
      #each score start from zero and makes sure it doesn't start over
      #the times are in seconds
      #it has iterations
      #takeing the sum of all the points
      #makes sure it gets the proper score at the end
      @scores[quiz.language.name] = ((@scores[quiz.language.name] || 0) + quiz.score)
      @totals["total_study_time"] = @totals["total_study_time"] || 0 + (quiz.updated_at - quiz.created_at)
    end
    @totals["total_points"] = @user.quizzes.map {|quiz| quiz.score}.sum
    raise
  end
end
