class Answer < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :question
  belongs_to :option, optional: true

  validates :question_id, presence: true
  validates :value, presence: true, if: :is_value_require
  validates :option_id, presence: true, if: :is_option_require

  after_save :delete_uncheck_option
  after_destroy :reset_answer_count

  def self.insert_answers(answers, count, user_id = nil)
    ActiveRecord::Base.transaction do
      answers.each do |answer|
        answer[:user_id] = user_id
        ans = self.find_or_initialize_by(id: answer[:id], question_id: answer[:question_id])
        if ans.new_record?
          new_ans = self.new(answer.slice(:question_id, :value, :user_id, :option_id))
          new_ans.answer_count = count
          new_ans.save
        else
          ans.update(answer.slice(:question_id, :value, :option_id))
        end
      end
    end
  end

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

  def reset_answer_count
    answers = question.form.get_answers

    answers.each_with_index do |(count, answers), index|
      answers.each do |answer|
        answer.update(answer_count: index + 1)
      end
    end
  end
end
