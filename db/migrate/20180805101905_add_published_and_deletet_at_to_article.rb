class AddPublishedAndDeletetAtToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :published, :boolean, default: true
    add_column :articles, :deleted_at, :datetime
  end
end
