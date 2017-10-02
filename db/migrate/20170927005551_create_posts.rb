class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :category
      t.integer :main_image_id

      t.timestamps
    end
  end
end
