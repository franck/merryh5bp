namespace :merryh5bp do
  
  desc "install H5BP files in app, remove protypes files"
  task :setup => :environment do
    
    cleaning_not_used_javascripts_file
      
    Rake::Task['merryh5bp:import_default_layout'].invoke
    Rake::Task['merryh5bp:import_assets'].invoke
  end
    
  desc "Copy application.html.erb"
  task :import_default_layout => :environment do
    assets = File.expand_path(File.join(File.dirname(__FILE__), '../../../app/views/layouts/application.html.erb'))
    command = "cp -R #{assets} #{Rails.root}/app/views/layouts/application.html.erb"
    puts command
    system(command)
  end
  
  desc "Copies all merrycms assets to public/ directory"
  task :import_assets => :environment do
    assets = File.expand_path(File.join(File.dirname(__FILE__), '../../../public/'))
    command = "cp -R #{assets} #{Rails.root}/"
    puts command
    system(command)
  end
  
  def cleaning_not_used_javascripts_file
    system('rm public/javascripts/controls.js')
    system('rm public/javascripts/dragdrop.js')
    system('rm public/javascripts/effects.js')
    system('rm public/javascripts/prototype.js')
    system('rm public/javascripts/rails.js')
  end
  
end