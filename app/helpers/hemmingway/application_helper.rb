module Hemmingway
  module ApplicationHelper
    RAILS_ROUTES = Rails.application.routes.url_helpers
    
    RAILS_ROUTES.public_methods.each do |method|
      next unless method.to_s =~ /_path$/ || method.to_s =~ /_url$/
      delegate method, to: :RAILS_ROUTES unless Hemmingway::Engine.routes.url_helpers.respond_to?(method)
    end
  end
end
