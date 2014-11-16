# We have to define our own route helpers for internal Hemmingway usage.
# Otherwise it will try to call the engine's routes, and all our
# routes are defined under Hemmingway.parent_engine.routes

module Hemmingway
  module RouteHelpers
    def helper_name
      Hemmingway.routes.to_s == 'root' ? 'root_page' : Hemmingway.routes.to_s
    end

    [:hw_pages, :hw_page, :edit_hw_page].each do |helper|
      define_method "#{helper}_path" do |param, *args|
        param = param.to_param if param.is_a?(Hemmingway::Page)
        parent_helper = helper.to_s.gsub(/hw/, 'hemmingway') + "_path"
        Hemmingway.parent_engine.routes.url_helpers.send(parent_helper, param, *args)
      end

      define_method "#{helper}_url" do |param, *args|
        param = param.to_param if param.is_a?(Hemmingway::Page)
        parent_helper = helper.to_s.gsub(/hw/, 'hemmingway') + "_url"
        Hemmingway.parent_engine.routes.url_helpers.send(parent_helper, param, *args)
      end
    end

    %w(hw_pages new_hw_page styles_hw_pages preview_hw_pages).each do |helper|
      define_method "#{helper}_path" do |*args|
        parent_helper = helper.to_s.gsub(/hw/, 'hemmingway') + "_path"
        Hemmingway.parent_engine.routes.url_helpers.send(parent_helper, *args)
      end

      define_method "#{helper}_url" do |*args|
        parent_helper = helper.to_s.gsub(/hw/, 'hemmingway') + "_url"
        Hemmingway.parent_engine.routes.url_helpers.send(parent_helper, args)
      end
    end

    def parent_page_path(param, *args)
      param = param.to_param if param.is_a?(Hemmingway::Page)
      Hemmingway.parent_engine.routes.url_helpers.send("#{helper_name}_path".to_sym, param, *args)
    end

    def parent_page_url(param, *args)
      param = param.to_param if param.is_a?(Hemmingway::Page)
      Hemmingway.parent_engine.routes.url_helpers.send("#{helper_name}_url".to_sym, param, *args)
    end
  end
end