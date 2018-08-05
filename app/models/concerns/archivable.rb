module Archivable
  extend ActiveSupport::Concern

  included do
    scope :unarchived, -> { where(deleted_at: nil) }
    scope :archived, -> { where.not(deleted_at: nil) }
  end

  def delete
    self.touch :deleted_at
  end

  def restore
    self.update_attribute :deleted_at, nil
  end
end
