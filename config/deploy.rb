default_run_options[:pty] = true
set :application, "cphapp"
set :repository,  ""git://github.com/kostasvav/Cphapp.git"
set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, "/var/www/apps/#{application}"
set :user, "deploy"
set :admin_runner, "deploy"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "sampleapp.cphapp.com"                          # Your HTTP server, Apache/etc
role :app, "sampleapp.cphapp.com"                          # This may be the same as your `Web` server
role :db,  "sampleapp.cphapp.com", :primary => true # This is where Rails migrations will run
role :db,  "your slave db-server here"

 namespace :deploy do
    desc "Restart Application"
    task :restart, :roles => :app do
      run "touch #{current_path}/tmp/restart.txt"
    end
    desc "Start Application -- not needed for Passenger"
    task :start, :roles => :app do
      # nothing -- need to override default cap start task when using Passenger
    end
  end

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end