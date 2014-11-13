module Hemmingway
  module Configuration

    OPTIONS = [
      :home_page,
      :layout,
      :admin_check,
      :parent_engine,
      :routes,
      :original_route_set,
      :cache
    ]

    attr_accessor *OPTIONS

    def configure
      yield self
    end

    def admin_check=(check)
      raise ArgumentError.new("admin_check must be a Proc") unless check.is_a?(Proc)
      @admin_check = check
    end

    def self.extended(base)
      base.set_default_configuration
    end

    def set_default_configuration
      self.layout = 'hemmingway/application'
      self.home_page = nil
      self.admin_check = Proc.new { true }
      self.routes = :page
      self.cache = false
    end

    OPTIONS.each do |option|
      define_method "#{option}?" do
        self.send(option).present?
      end
    end
  end
end