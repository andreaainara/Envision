class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :picture
      t.string :text
      t.references :board, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
