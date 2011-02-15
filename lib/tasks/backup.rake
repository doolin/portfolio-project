
# gem install aws-s3
# add gem 'aws-s3' to Gemfile, bundle install

require 'rake'
require 'aws/s3'

# Example cut and paste runtime: rake backups:backup

namespace :backups do 

  desc "backup from localhost and send to S3"
  task :backup => :environment do
 
    puts "From :backup..."

  end


end
