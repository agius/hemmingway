module Hemmingway
  class Engine < ::Rails::Engine
    isolate_namespace Hemmingway

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    initializer 'hemmingway.assets.precompile' do |app|
      app.config.assets.precompile += %w(application.css application.js)
    end
  
  end
end
