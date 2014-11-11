module Hemmingway
  class Page < ActiveRecord::Base

    def to_param
      url
    end
  end
end
