class AddQuestionIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :question_id, :integer
  end
end
