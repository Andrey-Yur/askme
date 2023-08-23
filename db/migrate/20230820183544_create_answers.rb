class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.text :body
      t.integer :question_id
      t.timestamps
    end
  end
end
