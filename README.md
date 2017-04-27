# Elb Health Check

#### Simple healthcheck for Rails apps.


## Installation

Include **elb-health-check** in your Gemfile.

```ruby
gem 'elb-health-check'
```

## Usage

In most cases you have to do nothing else, but you can configure the checks like
this.

```
ElbHealthCheck.configure |config|
  config.uris = ['/health_check']  # default
  config.checks = %i(database)     # default
end
```
