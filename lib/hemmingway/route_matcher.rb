module Hemmingway
  class RouteMatcher
    
    def self.match_routes
      if Hemmingway.routes.to_s == 'root'
        {
          "/*id" => 'hemmingway/pages#show',
          as: :root_page,
          constraint: Hemmingway::Constraint.new
        }
      else
        {
          "/#{Hemmingway.routes}/*id" => 'hemmingway/pages#show',
          as: Hemmingway.routes,
          constraint: Hemmingway::Constraint.new
        }
      end

    end
  end
end