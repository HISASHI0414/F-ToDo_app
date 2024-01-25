class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.references :user, null: false
      t.text :board_name, null: false
      t.timestamps
    end
  end
end
