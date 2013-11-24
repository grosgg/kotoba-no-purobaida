require 'rake'

namespace :maintenance do

  desc "Recalculate tag counts"
  task :reset_tags => :environment do
    Tag.all.delete

    Word.all.each do |word|
      word.tags.each do |tag|
        puts 'Increments '+tag
        tag = Tag.find_or_create_by(:name => tag, :user => word.user)
        tag.count+=1
        tag.save
      end
    end
  end
end