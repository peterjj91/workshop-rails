class Article < ApplicationRecord
  include Archivable
  scope :unarchived_and_published, -> { unarchived.where(published: true) }
  scope :unpublished, -> { where(published: false) }
  belongs_to :user
  has_many :comments
end
