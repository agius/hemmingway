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
    end
  end
end