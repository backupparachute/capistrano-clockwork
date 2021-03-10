require "capistrano/clockwork/version"

# module Capistrano
#   module DelayedJob
    
namespace :clockwork do
  desc "Start clockwork"
  task :start do
    on roles(:app) do
      # on primary(:app) do
        # on release_roles(:all) do
          within release_path do
            with rails_env: fetch(:rails_env) do
              run "cd #{current_path} && RAILS_ENV=#{fetch(:rails_env)} bundle exec clockworkd -c #{current_path}/lib/clock.rb --pid-dir #{shared_path}/pids --log --log-dir #{shared_path}/log start"
              execute :bundle, :exec, :clockworkd, "-c lib/clock.rb --pid-dir tmp/pids --log --log-dir logs start"
            end
          end
        # end
      # end
    end
  end
  
#   task :restart do
#     on roles(:app) do
#       on primary(:app) do
#         on release_roles(:all) do
#           within release_path do
#
#           with rails_env: fetch(:rails_env) do
#             # run "cd #{current_path} && RAILS_ENV=#{fetch(:rails_env)} bundle exec clockworkd -c #{current_path}/lib/clock.rb --pid-dir #{shared_path}/pids --log --log-dir #{shared_path}/log restart"
#               execute :bundle, :exec, :clockworkd, "-c lib/clock.rb --pid-dir tmp/pids --log --log-dir logs restart"
#           end
#         end
#         end
#       end
#     end
#   end
#
#   task :stop do
#     on roles(:app) do
#       on primary(:app) do
#         on release_roles(:all) do
#           within release_path do
#
#           with rails_env: fetch(:rails_env) do
#             execute :bundle, :exec, :clockworkd, "-c lib/clock.rb --pid-dir tmp/pids --log --log-dir logs stop"
#             # run "cd #{current_path} && RAILS_ENV=#{fetch(:rails_env)} bundle exec clockworkd -c #{current_path}/lib/clock.rb --pid-dir #{shared_path}/pids --log --log-dir #{shared_path}/log stop"
#           end
#         end
#         end
#       end
#     end
#   end
#
# end
# end
end