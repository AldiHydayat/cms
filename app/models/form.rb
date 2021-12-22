class Form < ApplicationRecord
  has_many :questions, -> { order(position: :asc) }, dependent: :destroy

  accepts_nested_attributes_for :questions

  validates :title, :description, presence: true
  validates_presence_of :questions

  def get_answers
    questions_id = questions.pluck(:id)
    answers = Answer.where(question_id: questions_id).group_by(&:answer_count)
  end

  def get_answers_count
    questions_id = questions.pluck(:id)
    Answer.where(question_id: questions_id).group_by(&:answer_count).length + 1
  end
end
