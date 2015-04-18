class InitialSchema < ActiveRecord::Migration
  def change
    create_table :postoss_categories do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.integer :use_layout, limit: 1, default: 1, null: false

      t.timestamps null: false
    end
    add_index :postoss_categories, :name, unique: true
    add_index :postoss_categories, :slug, unique: true

    create_table :postoss_posts do |t|
      t.string :unique_id, null: false, limit: 16
      t.integer :category_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.string :thumbnail

      t.timestamps null: false
    end
    add_index :postoss_posts, :category_id
    add_index :postoss_posts, :unique_id, unique: true
    add_foreign_key :postoss_posts, :categories

    create_table :postoss_images do |t|
      t.string :unique_id, null: false, limit: 16
      t.string :file, null: false

      t.timestamps null: false
    end
    add_index :postoss_images, :unique_id, unique: true
  end
end
