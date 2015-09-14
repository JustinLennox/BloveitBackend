class User < ActiveRecord::Base
	has_many :date_stories
	serialize :favorites
end
