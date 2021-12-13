class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.integer :question_id
      t.string :option_text
      t.string :option_value

      t.timestamps
    end
  end
end
