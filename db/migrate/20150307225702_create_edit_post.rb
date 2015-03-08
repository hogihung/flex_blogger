class CreateEditPost < ActiveRecord::Migration
  def change
    create_table :editor_posts do |t|
      t.references :post
      t.integer :editor_id
      t.index :post_id
      t.index :editor_id
      t.timestamps
    end
  end
end
