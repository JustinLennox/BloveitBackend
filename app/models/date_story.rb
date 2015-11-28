class DateStory < ActiveRecord::Base
	belongs_to :venue
	belongs_to :user
	default_scope { order("created_at DESC") }

end
