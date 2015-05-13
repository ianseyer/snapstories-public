#!/usr/bin/env rackup
# encoding: utf-8

# This file can be used to start Padrino,
# just execute it from the command line.

#this allows CORS via the gem rack-cors
require 'rack/cors'

use Rack::Cors do
  allow do
    origins '*'

    resource '*',
        :methods => [:get, :post, :put, :delete, :options, :patch],
        :headers => :any
  end
end

require File.expand_path("../config/boot.rb", __FILE__)

run Padrino.application
