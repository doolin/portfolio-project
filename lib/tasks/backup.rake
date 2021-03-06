# frozen_string_literal: true
# gem install aws-s3
# add gem 'aws-s3' to Gemfile, bundle install
# http://devcenter.heroku.com/articles/config-vars
# http://devcenter.heroku.com/articles/s3

# require 'rake/dsl_definition'

=begin

require 'rake'
require 'yaml'
require 'aws/s3'

#module ::PortfolioProject
#  class Application
#    include Rake::DSL
#  end
#end

BACKUP_BUCKET_NAME = 'portfolio-project'
#FILENAME = 'testfile.txt'

APP_NAME = "portproj"

namespace :perez do

  desc "backup db from heroku and send to S3"
  task :backup => :environment do

    APP_NAME = 'portproj' # put your app name here
    BACKUP_BUCKET = 'portfolio-project' # put your backup bucket name here
    #DB_CONFIG = YAML::load(ERB.new(IO.read(File.join(RAILS_ROOT, 'config', 'database.yml'))).result)[RAILS_ENV]
    DB_CONFIG = YAML::load(ERB.new(IO.read(File.join(Rails.root, 'config', 'database.yml'))).result)[Rails.env]

    puts "backup started @ #{Time.now}"

    puts "dumping sql file..."

    backup_name =  "#{Time.now.to_s(:number)}_#{APP_NAME}.dump"
    backup_path = "tmp/#{backup_name}"

    #`echo #{DB_CONFIG['password']} | pg_dump #{DB_CONFIG['database']} -Fc --username=#{DB_CONFIG['username']} --host=#{DB_CONFIG['host']} > #{backup_path}`
     system "PGPASSWORD=#{DB_CONFIG['password']} pg_dump #{DB_CONFIG['database']} -Fc --username=#{DB_CONFIG['username']} --host=#{DB_CONFIG['host']} > #{backup_path}"
    # Assumes PGPASSWORD is set, check DB_CONFIG.
    #`pg_dump #{DB_CONFIG['database']} -Fc --username=#{DB_CONFIG['username']} --host=#{DB_CONFIG['host']} > #{backup_path}`

    puts "gzipping sql file..."
    `gzip #{backup_path}`

    backup_name += ".gz"
    backup_path = "tmp/#{backup_name}"

    puts "connecting to S..."
      AWS::S3::Base.establish_connection!(
        :access_key_id => ENV['S3_KEY'],
        :secret_access_key => ENV['S3_SECRET']
        )

    begin
      bucket = AWS::S3::Bucket.find(BACKUP_BUCKET)
    rescue AWS::S3::NoSuchBucket
      AWS::S3::Bucket.create(BACKUP_BUCKET)
      bucket = AWS::S3::Bucket.find(BACKUP_BUCKET)
    end

    puts "uploading #{backup_name} to S3..."

    AWS::S3::S3Object.store(backup_name, File.open(backup_path,"r"), bucket.name, :content_type => 'application/x-gzip')
    `rm -rf #{backup_path}`
    puts "backup completed @ #{Time.now}"

 end

end


# TODO: Test this and use it, or get rid of it.
def connect_s3!
  AWS::S3::Base.establish_connection!(
    :access_key_id     => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET']
  )
  #puts ENV['S3_KEY']
end

# NOTE: Use the perez:backup code instead
# Example: rake backups:backup
namespace :backups do

  desc "backup from localhost and send to S3"
  #task :backup => :environment do
  task :backup, :bucketname, :filename do |t, args|
    puts "From :backup..."

    BACKUP_BUCKET_NAME = args.bucketname
    FILENAME = args.filename

    puts "Connecting to S3..."
    connect_s3!

    puts "Finding bucket named ", BACKUP_BUCKET_NAME, "..."
    bucket = AWS::S3::Bucket.find BACKUP_BUCKET_NAME
    puts "Uploading file..."
    AWS::S3::S3Object.store FILENAME, File.read(FILENAME), bucket.name

  end


  desc "Dump a postgres database into tmp"
  task :pgdump do
    puts "backup started @ #{Time.now}"
    puts "dumping sql file.."
    backup_name =  "#{APP_NAME}_#{Time.now.to_s(:number)}.sql"
    backup_path = "tmp/#{backup_name}"
    DB_CONFIG = YAML::load(ERB.new(IO.read(File.join(Rails.root.to_s, 'config', 'database.yml'))).result)[Rails.env]
    `echo #{DB_CONFIG['password']} | pg_dump #{DB_CONFIG['database']} -Fc --username=#{DB_CONFIG['username']} --host=#{DB_CONFIG['host']} > #{backup_path}`
  end

  desc "Create a name for the backup file"
  task :createname do
    backup_name = Time.now.strftime("%Y%m%d_%H%M%S") + "_#{APP_NAME}"
    puts backup_name
  end


  desc "Extract the database configuration"
  task :getdbconfig do
    #DB_CONFIG = YAML::load(ERB.new(IO.read(File.join(RAILS_ROOT, 'config', 'database.yml'))).result)[RAILS_ENV]
    DB_CONFIG = YAML::load(ERB.new(IO.read(File.join(Rails.root.to_s, 'config', 'database.yml'))).result)[Rails.env]
    puts DB_CONFIG
  end

end
=end
