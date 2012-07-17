# desc "Explaining what the task does"
# task :shopqi-app-webhook do
#   # Task goes here
# end

task "resque:setup" => :environment
require 'resque/tasks'
