require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RealTimePolls
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'env_variables.yml')
      if File.exists?(env_file)
        YAML.load(File.open(env_file)).each do |key, value|
          ENV[key.to_s] = value
        end
      else
        raise 'ERROR: env_variables.yml does not exist. check application.rb'
      end
    end

  end
end
