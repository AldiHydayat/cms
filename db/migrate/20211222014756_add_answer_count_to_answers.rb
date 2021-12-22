class AddAnswerCountToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :answer_count, :integer, default: 0
  end
end
