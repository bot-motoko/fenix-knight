class Entry < ActiveRecord::Base
  belongs_to :provider
  acts_as_taggable_on :tags
  scope :recent, -> { order(created_at: :desc) }
end
