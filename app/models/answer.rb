class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :option, optional: true

  validates :question_id, :user_id, presence: true
  validates :value, presence: true, if: :is_value_require
  validates :option_id, presence: true, if: :is_option_require

  private

  def is_value_require
    question.is_required && ["text_field", "text_area", "rating"].include?(question.input_type)
  end

  def is_option_require
    question.is_required && ["single_option", "multiple_option"].include?(question.input_type)
  end
end
