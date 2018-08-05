class CreateArticleCommentLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :article_comment_likes do |t|
      t.integer :article_id
      t.integer :comment_id
    end

    add_index :article_comment_likes, [:article_id, :comment_id], unique: true)
  end
end
