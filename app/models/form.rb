class Form < ApplicationRecord
  has_many :questions, -> { order(position: :asc) }, dependent: :destroy

  accepts_nested_attributes_for :questions

  validates :title, :description, presence: true
  validates_presence_of :questions

  def get_answers
    questions_id = questions.pluck(:id)
    answers = Answer.includes(:question).where(question_id: questions_id).group_by(&:user_id)
  end
end
