# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Project.create(:name        => 'First project from seed',
               :member_id   => 1,
               :summary     => 'This is the summary',
               :description => 'This is the description',
               :startdate   => "2011-12-10 00:00:00",
               :finishdate  => "2011-12-10 00:00:00",
               :tags        => 'foo bar')
