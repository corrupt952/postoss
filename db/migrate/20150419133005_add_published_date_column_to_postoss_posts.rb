class AddPublishedDateColumnToPostossPosts < ActiveRecord::Migration
  def change
    add_column :postoss_posts, :published_date, :date, after: :body
  end
end
