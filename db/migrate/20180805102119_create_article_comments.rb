class CreateArticleComments < ActiveRecord::Migration[5.1]
  def change
    create_table :article_comments do |t|
      t.string :text
      t.references :user
      t.references :article

      t.timestamps
    end
  end
end
