module Hemmingway
  class Page < ActiveRecord::Base
    validates :url, uniqueness: true
    validate :no_existing_route
    
    after_save :set_cache, if: Proc.new { Hemmingway.cache? }
    after_destroy :clear_cache, if: Proc.new { Hemmingway.cache? }

    def self.cache_key(url)
      "hemmingway-#{url}"
    end

    def to_param
      url
    end

    def set_cache
      Rails.cache.write(self.class.cache_key(url), html)
    end

    def clear_cache
      Rails.cache.delete(self.class.cache_key(url))
    end

    def no_existing_route
      params = Rails.application.routes.recognize_path(url)
      errors.add(:url, 'matches an existing page') unless params[:controller] =~ /hemmingway/
    rescue ActionController::RoutingError => e
      Rails.logger.debug e
      # no route matches, therefor this route is okay
    end
  end
end
