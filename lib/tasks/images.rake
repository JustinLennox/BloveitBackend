namespace :images do
  desc "Resize all of the venue images"
  task :resize_venues => :environment do
     Venue.all.each do |venue|
       venue.polaroid_image.reprocess!
       venue.thumbnail_image.reprocess! 
       venue.venue_image_1.reprocess!
       venue.venue_image_2.reprocess!
       venue.venue_image_3.reprocess!
       venue.venue_image_4.reprocess!
       venue.venue_image_5.reprocess!
     end
  end
end