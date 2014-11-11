module Hemmingway
  module Configuration

    attr_accessor(
      :home_page,
      :layout,
      :admin_check
    )

    def configure
      yield self
    end

    def self.extended(base)
      base.set_default_configuration
    end

    def set_default_configuration
      self.layout = 'application'
      self.home_page = nil
      self.admin_check = ->{ true }
    end
  end
end