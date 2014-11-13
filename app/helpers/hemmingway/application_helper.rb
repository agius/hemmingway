module Hemmingway
  module ApplicationHelper
    include Hemmingway.parent_engine.routes.url_helpers
    include Hemmingway::RouteHelpers
  end
end
