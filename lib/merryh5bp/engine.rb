module Merryh5bp
  class Engine < Rails::Engine
      
    rake_tasks do
      load "merryh5bp/railties/merryh5bp_tasks.rake"
    end
    
  end
end
