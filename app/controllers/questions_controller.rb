class QuestionsController < ApplicationController
  before_action :set_question

  def to_higher
    @question.move_higher
    redirect_back(fallback_location: root_path)
  end

  def to_lower
    @question.move_lower
    redirect_back(fallback_location: root_path)
  end

  def remove
    @question.destroy
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end
end
