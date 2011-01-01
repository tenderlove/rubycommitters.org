require 'compass'

Compass.configuration do |config|
  config.project_path = Rails.root.to_s
  config.sass_dir = 'app/stylesheets'
  config.css_dir = 'public/stylesheets'
end

Compass.configure_sass_plugin!
