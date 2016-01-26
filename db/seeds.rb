# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# go through every file in the seeds directory
Dir.glob(Rails.root.join('db', 'seeds', '*.yml')).select do |path|
  if File.file?(path)
    klass = path.gsub(Rails.root.join('db', 'seeds').to_s + '/','').gsub('.yml','').camelize.singularize.constantize
    puts "Importing #{klass.to_s.pluralize}..."

    # lets make sure we're actually dealing with a class here
    if klass.kind_of?(Class)
      data = YAML::load_file(path)

      # iterate through the data if we have something
      if data.size > 0
        data.each do |values|
          klass.first_or_create(values)
        end
      end
    end
  end
end