class AddStatusIdColumnToPostossPosts < ActiveRecord::Migration
  def change
    add_column :postoss_posts, :status_id, :integer,
      null: false, default: 0, after: :category_id
  end
end
