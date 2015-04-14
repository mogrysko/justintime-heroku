class AddIndexToTermIdCourseIdInTermlists < ActiveRecord::Migration
  def change
    add_index :termlists, :term_id
    add_index :termlists, :course_id
  end
end
