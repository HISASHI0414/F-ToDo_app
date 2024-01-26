class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      t.references :board, null: false
      t.text :task_title
      t.date :task_deadline
      t.text :task_content
      t.timestamps
    end
  end
end
