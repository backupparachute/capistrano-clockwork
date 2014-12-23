require "capistrano/clockwork/version"

module Capistrano
  module Clockwork
    
    config = Capistrano::Configuration.instance

    if config

      config.load do
        namespace :clockwork do
          desc "Start clockwork"
          task :start, :roles => [:app] do
            run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec clockworkd -c #{current_path}/lib/clock.rb --pid-dir #{shared_path}/pids --log --log-dir #{shared_path}/log start"
          end

          task :stop, :roles => [:app] do
            run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec clockworkd -c #{current_path}/lib/clock.rb --pid-dir #{shared_path}/pids --log --log-dir #{shared_path}/log stop"
          end

          task :restart, :roles => [:app] do
            run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec clockworkd -c #{current_path}/lib/clock.rb --pid-dir #{shared_path}/pids --log --log-dir #{shared_path}/log restart"
          end
        end
        
      end
    end
    
  end
end
