$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'hemmingway/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'hemmingway'
  s.version     = Hemmingway::VERSION
  s.authors     = ['Andrew Evans']
  s.email       = ['andrew.evans@hired.com']
  s.homepage    = 'https://github.com/hired/hemmingway'
  s.summary     = 'A dead-simple CMS for /about and other static pages.'
  s.description = 'A dead-simple CMS for /about and other static pages.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 4.1.7'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails', '~> 3.0.0'
  s.add_development_dependency 'fuubar'
  s.add_development_dependency 'factory_girl_rails'
end
