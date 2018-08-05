class Article < ApplicationRecord
  include Archivable
  scope :unarchived_and_published, -> { unarchived.where(published: true) }
  scope :unpublished, -> { where(published: false) }
  belongs_to :user
  has_many :comments

  state_machine :status, initial: :draft do
    state :draft
    state :ready_to_publish
    state :published

    event :accept do
      transition draft: :ready_to_publish
    end

    event :publish do
      transition ready_to_publish: :published
    end
  end

end
