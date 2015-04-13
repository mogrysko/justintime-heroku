class CreateTermlists < ActiveRecord::Migration
  def change
    create_table :termlists do |t|
      t.integer :course_id
      t.integer :term_id

      t.timestamps null: false
    end
  end
end
