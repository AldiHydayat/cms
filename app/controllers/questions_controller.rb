class QuestionsController < ApplicationController
  before_action :set_question

  def to_higher
    # Tidak Berubah
    @question.move_higher
    @question.save
    redirect_back(fallback_location: root_path)
  end

  def to_lower
    # Tidak Berubah
    @question.move_lower
    debugger
    @question.save
    redirect_back(fallback_location: root_path)
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end
end
