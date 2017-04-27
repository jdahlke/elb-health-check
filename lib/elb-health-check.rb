module ElbHealthCheck
  mattr_accessor :uris, :checks

  def self.configure
    yield self
  end

  # Default config
  self.uris = ['/health_check']
  self.checks = %i(database)
end

require 'elb_health_check/middleware'
require 'elb_health_check/railtie'

