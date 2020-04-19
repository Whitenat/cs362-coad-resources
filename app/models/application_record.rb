# Is a... super class? that extends active record so that we can
# extend all of our model classes with common functionality easily

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
