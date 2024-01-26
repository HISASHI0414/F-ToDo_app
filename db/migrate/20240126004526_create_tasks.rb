class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      t.references :board, null: false
      t.text :task_title, null: false
      t.date :task_deadline, null: false
      t.text :task_content, null: false
      t.timestamps
    end
  end
end
