module Hemmingway
  module RouteHelpers
    def helper_name
      Hemmingway.routes.to_s == 'root' ? 'root_page' : Hemmingway.routes.to_s
    end

    def parent_page_path(param)
      param = param.to_param if param.is_a?(Hemmingway::Page)
      Hemmingway.parent_engine.routes.url_helpers.hemmingway_page_path(param)
    end

    def parent_page_url(param)
      param = param.to_param if param.is_a?(Hemmingway::Page)
      Hemmingway.parent_engine.routes.url_helpers.hemmingway_page_url(param)
    end

    def hw_page_path(param)
      param = param.to_param if param.is_a?(Hemmingway::Page)
      Hemmingway.parent_engine.routes.url_helpers.send("#{helper_name}_path".to_sym, param)
    end

    def hw_page_url(param)
      param = param.to_param if param.is_a?(Hemmingway::Page)
      Hemmingway.parent_engine.routes.url_helpers.send("#{helper_name}_url".to_sym, param)
    end
  end
end