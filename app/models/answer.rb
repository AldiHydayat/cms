class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :option, optional: true

  validates :question_id, :user_id, presence: true
  validates :value, presence: true, if: :is_value_require
  validates :option_id, presence: true, if: :is_option_require

  after_save :delete_uncheck_option

  private

  def is_value_require
    question.is_required && ["text_field", "text_area", "rating"].include?(question.input_type)
  end

  def is_option_require
    question.is_required && ["single_option", "multiple_option"].include?(question.input_type)
  end

  def delete_uncheck_option
    if value.nil? && option_id == 0
      self.destroy
    end
  end
end
