class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :user_id
      t.text :value
      t.integer :option_id

      t.timestamps
    end
  end
end
