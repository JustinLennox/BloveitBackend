class Venue < ActiveRecord::Base
	has_many :date_stories
	scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
end
