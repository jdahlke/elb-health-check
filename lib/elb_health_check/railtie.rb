require 'rails'

module ElbHealthCheck
  class Railtie < ::Rails::Railtie
    config.app_middleware.insert_before 0, ElbHealthCheck::Middleware
  end
end
