module Hemmingway
  class Constraint

    def matches?(request)
      return false if Hemmingway.parent_engine.routes.recognize_path(request.path)
      if Hemmingway.cache?
        Rails.cache.fetch(Hemmingway::Page.cache_key(request.path)) do
          Hemmingway::Page.where(url: request.path).pluck(:html)
        end
      else
        Hemmingway::Page.where(url: request.path).exists?
      end
    end

  end
end