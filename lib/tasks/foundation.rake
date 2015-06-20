
namespace :zurb do

  desc 'Updating the Zurb Foundation stylesheets'
  task :update do
    puts 'Updating...'
    home = ENV['HOME']
    srcpath    = ENV['HOME'] + '/local/src/foundation'
    jspath     = `pwd`.chomp + '/app/assets/javascripts/foundation'
    csspath    = `pwd`.chomp + '/app/assets/stylesheets/foundation'
    imagepath  = `pwd`.chomp + '/app/assets/images/foundation'
    #puts srcpath
    #puts jspath
    #puts csspath
    #puts imagepath
    system "cp -R #{srcpath}/images/ #{imagepath}"
    # Change to rsync to exclude jquery.min.js
    system "cp -R #{srcpath}/javascripts/ #{jspath}"
    system "rm #{jspath}/jquery.min.js"
    system "cp -R #{srcpath}/stylesheets/ #{csspath}"
  end

end
