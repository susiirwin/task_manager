require 'bundler'
Bundler.require

APP_ROOT = File.expand_path("..", __dir__)

# Load all controllers - the join method creates the path based on the given parameters
Dir.glob(File.join(APP_ROOT, "app", "controllers", "*.rb")).each { |file| require file }
# Load all models - the join method creates the path based on the given parameters
Dir.glob(File.join(APP_ROOT, "app", "models", "*.rb")).each { |file| require file }

class TaskManagerApp < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, "app", "views")
  set :public_folder, File.join(APP_ROOT, "app", "public")
end
