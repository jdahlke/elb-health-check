# frozen_string_literal: true

module ElbHealthCheck
  mattr_accessor :uris, :checks

  def self.configure
    yield self
  end

  self.uris = ['/health-check', '/healthcheck', '/health_check']
  self.checks = %i[database]
end

require 'elb_health_check/middleware'
require 'elb_health_check/railtie'
