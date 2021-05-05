# frozen_string_literal: true

module ElbHealthCheck
  class Middleware
    attr_accessor :app

    def initialize(app)
      @app = app
    end

    def call(env)
      return app.call(env) unless ElbHealthCheck.uris.include?(env['PATH_INFO'])

      checks = ElbHealthCheck.checks.map { |check| send("#{check}?") }

      if checks.include?(false)
        [500, {}, ['FAILED']]
      else
        [200, {}, ['OK']]
      end
    end

    private

    def database?
      if defined?(ActiveRecord)
        ActiveRecord::Base.connection.active?
      else
        true
      end
    end
  end
end
