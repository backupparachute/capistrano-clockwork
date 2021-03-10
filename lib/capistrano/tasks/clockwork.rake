# namespace :load do
#   task :defaults do
#     set :clockwork_file, -> { "lib/clock.rb" }
#   end
# end

namespace :deploy do
  before :starting, :deploy do
    invoke 'clockwork:add_default_hooks'
  end
end

namespace :clockwork do

  task :start do
    on roles(:app) do
       on primary(:app) do
         on release_roles(:all) do
          within release_path do
            with rails_env: fetch(:rails_env) do
              # run "cd #{current_path} && RAILS_ENV=#{fetch(:rails_env)} bundle exec clockworkd -c #{current_path}/lib/clock.rb --pid-dir #{shared_path}/pids --log --log-dir #{shared_path}/log start"
              execute :bundle, :exec, :clockworkd, "-c lib/clock.rb --pid-dir #{cw_pid_dir} --log --log-dir #{cw_log_dir} start"
            end
          end
         end
       end
    end
  end
  
  task :restart do
    on roles(:app) do
      on primary(:app) do
        on release_roles(:all) do
          within release_path do

          with rails_env: fetch(:rails_env) do
            # run "cd #{current_path} && RAILS_ENV=#{fetch(:rails_env)} bundle exec clockworkd -c #{current_path}/lib/clock.rb --pid-dir #{shared_path}/pids --log --log-dir #{shared_path}/log restart"
              execute :bundle, :exec, :clockworkd, "-c lib/clock.rb --pid-dir #{cw_pid_dir} --log --log-dir #{cw_log_dir} restart"
          end
        end
        end
      end
    end
  end
#

  task :stop do
    on roles(:app) do
      on primary(:app) do
        on release_roles(:all) do
          within release_path do

          with rails_env: fetch(:rails_env) do
            execute :bundle, :exec, :clockworkd, "-c lib/clock.rb --pid-dir #{cw_pid_dir} --log --log-dir #{cw_log_dir} stop"
            # run "cd #{current_path} && RAILS_ENV=#{fetch(:rails_env)} bundle exec clockworkd -c #{current_path}/lib/clock.rb --pid-dir #{shared_path}/pids --log --log-dir #{shared_path}/log stop"
          end
        end
        end
      end
    end
  end
#

def cw_log_dir
  "#{shared_path}/log"
end

def cw_pid_dir
  "#{shared_path}/tmp/pids"
end

task :add_default_hooks do
   after 'deploy:publishing', 'clockwork:restart'
 end

end # namespace end
