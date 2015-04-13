class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :termname
      t.string :definition

      t.timestamps null: false
    end
  end
end
