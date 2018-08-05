class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles
  has_many :comments, class_name: "Article::Comment", foreign_key: "user_id"
end
