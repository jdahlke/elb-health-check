module ElbHealthCheck
  class Middleware
    attr_accessor :app

    def initialize(app)
      @app = app
    end

    def call(env)
      if ElbHealthCheck.uris.include?(env['PATH_INFO'])

        checks = ElbHealthCheck.checks.map { |check| send("#{check}?") }

        if checks.include?(false)
          return [500, {}, ['FAILED']]
        else
          return [200, {}, ['OK']]
        end
      end

      app.call(env)
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
