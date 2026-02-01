require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module JuanFuentes
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Cargar middleware personalizado
    config.middleware.insert_before 0, 'ThemeMiddleware'

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #

    # catch server errors (404, 500, 422)
    config.exceptions_app = self.routes
    
    # CUSTOM GENERATOR
    # @see: https://guides.rubyonrails.org/generators.html
    config.generators do |g|
      g.scaffold_stylesheet false
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  :test_unit, fixture: false
      g.stylesheets     false
    end

    config.time_zone = 'Mexico City'

    # Internationalization
    # @see: https://guides.rubyonrails.org/v7.2/i18n.html#setup-the-rails-application-for-internationalization
    # Default configuration for i18n is to load all locale files from
    # Locale files are expected to be at config/locales/*.yml
    #
    I18n.available_locales = [:es, :en]
    I18n.default_locale = :es

    # config.eager_load_paths << Rails.root.join("extras")
  end
end
