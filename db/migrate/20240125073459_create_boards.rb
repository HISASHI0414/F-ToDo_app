class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.references :user, null: false
      t.text :board_title, null: false
      t.text :board_content, null: false
      t.timestamps
    end
  end
end
