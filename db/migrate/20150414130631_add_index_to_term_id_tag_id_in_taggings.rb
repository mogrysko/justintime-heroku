class AddIndexToTermIdTagIdInTaggings < ActiveRecord::Migration
  def change
    add_index :taggings, :term_id
    add_index :taggings, :tag_id
  end
end
