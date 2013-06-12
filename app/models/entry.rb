class Entry < ActiveRecord::Base
  belongs_to :provider
  acts_as_taggable_on :tags
end
