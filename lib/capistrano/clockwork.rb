require "capistrano/clockwork/version"

module Capistrano
  module Clockwork
    
    load File.expand_path('../tasks/clockwork.rake', __FILE__)
    
    def noop
      #placeholder
    end
    
  end
end