class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false
      t.references :board, null: false
      t.references :task, null: false
      t.text :comment_content
      t.timestamps
    end
  end
end
