$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'elb_health_check/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'elb-health-check'
  s.version     = ElbHealthCheck::VERSION
  s.licenses    = 'MIT'
  s.authors     = ['Joergen Dahlke']
  s.email       = ['joergen.dahlke@gmail.com']
  s.homepage    = 'https://github.com/jdahlke/elb_health_check'
  s.summary     = %q{Simple healthcheck for Rails apps}
  s.description = %q{Provides an URL for to check the health of the application}

  s.rubyforge_project = 'elb-health-check'

  s.files         = `git ls-files -- lib/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  # specify any dependencies here:
  s.add_dependency 'railties'

  # specify any development dependencies here:
  s.add_development_dependency 'rubocop'
end
