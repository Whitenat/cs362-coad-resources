#Since "ActiveRecord::Base" does not get edited and is predefined with a bunch of functions 
#that do dynamic work for us (persisting to the Database (Ex: Project.find()), we created 
#a super class? that extends "ActiveRecord" so that we can extend all of our model classes with 
#common functionality easily.

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
