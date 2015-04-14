class AddIndexToTermnameInTerms < ActiveRecord::Migration
  def change
    add_index :terms, :termname
  end
end
