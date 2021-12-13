class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :form_id
      t.integer :input_type
      t.string :question
      t.string :placeholder
      t.boolean :is_required

      t.timestamps
    end
  end
end
