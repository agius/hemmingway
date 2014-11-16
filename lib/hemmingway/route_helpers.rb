module Hemmingway
  module RouteHelpers
    def helper_name
      Hemmingway.routes.to_s == 'root' ? 'root_page' : Hemmingway.routes.to_s
    end

    [:hw_pages, :hw_page, :edit_hw_page].each do |helper|
      define_method "#{helper}_path" do |param|
        param = param.to_param if param.is_a?(Hemmingway::Page)
        parent_helper = helper.to_s.gsub(/hw/, 'hemmingway') + "_path"
        Hemmingway.parent_engine.routes.url_helpers.send(parent_helper, param)
      end

      define_method "#{helper}_url" do |param|
        param = param.to_param if param.is_a?(Hemmingway::Page)
        parent_helper = helper.to_s.gsub(/hw/, 'hemmingway') + "_url"
        Hemmingway.parent_engine.routes.url_helpers.send(parent_helper, param)
      end
    end

    %w(hw_pages new_hw_page).each do |helper|
      define_method "#{helper}_path" do
        parent_helper = helper.to_s.gsub(/hw/, 'hemmingway') + "_path"
        Hemmingway.parent_engine.routes.url_helpers.send(parent_helper)
      end

      define_method "#{helper}_url" do
        parent_helper = helper.to_s.gsub(/hw/, 'hemmingway') + "_url"
        Hemmingway.parent_engine.routes.url_helpers.send(parent_helper)
      end
    end

    def parent_page_path(param)
      param = param.to_param if param.is_a?(Hemmingway::Page)
      Hemmingway.parent_engine.routes.url_helpers.send("#{helper_name}_path".to_sym, param)
    end

    def parent_page_url(param)
      param = param.to_param if param.is_a?(Hemmingway::Page)
      Hemmingway.parent_engine.routes.url_helpers.send("#{helper_name}_url".to_sym, param)
    end
  end
end