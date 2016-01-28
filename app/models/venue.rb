class Venue < ActiveRecord::Base
	has_many :date_stories
	scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
	has_attached_file :polaroid_image, :styles => { :original => "520x400"}
	has_attached_file :thumbnail_image, :styles => { :original => "512x512"}
	has_attached_file :venue_image_1, :styles => { :original => "512x512"}
	has_attached_file :venue_image_2, :styles => { :original => "512x512"}
	has_attached_file :venue_image_3, :styles => { :original => "512x512"}
	has_attached_file :venue_image_4, :styles => { :original => "512x512"}
	has_attached_file :venue_image_5, :styles => { :original => "512x512"}
	validates_attachment :polaroid_image, :thumbnail_image, :venue_image_1, :venue_image_2, :venue_image_3, :venue_image_4, :venue_image_5, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end


