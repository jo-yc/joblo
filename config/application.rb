require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Jmission
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.time_zone = 'Tokyo'
    config.active_record.time_zone_aware_types = [:datetime, :time]

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # Generators
    config.generators do |g|
      g.template_engine :slim
      g.stylesheets false
      g.javascripts false
      g.helper false
      # g.test_framework :rspec, controller_specs: false, view_specs: false, helper_specs: false, routing_specs: false, fixture: true
      # g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
