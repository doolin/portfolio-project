# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

@member = Member.create(:membername => 'doolin2', :email => 'david.doolin+testseed@gmail.com', :password => 'foobar', :password_confirmation => 'foobar', :firstname => 'Dave', :lastname => 'Doolin')

#=begin
@project_attrs = {:name        => 'First project from seed',
                  :summary     => 'This is the summary',
                  :description => 'This is the description',
                  :startdate   => '2011-12-10 00:00:00',
                  :finishdate  => '2011-12-10 00:00:00',
                  :tags        => 'foo bar'}
@member.projects.build(@project_attrs)
@member.save
#=end


#=begin
@profile_attr = {:firstname => 'Dave',
                 :lastname  => 'Doolin',
                 :created_at => 1.minute.ago}
@member.build_profile(@profile_attr)
@member.save
#=end
