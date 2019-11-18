# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( yeti.css )
Rails.application.config.assets.precompile += %w( banner.css )
Rails.application.config.assets.precompile += %w( yeti.js )
Rails.application.config.assets.precompile += %w( user_sign_up.css )
Rails.application.config.assets.precompile += %w( course.js )
Rails.application.config.assets.precompile += %w( course.css )
Rails.application.config.assets.precompile += %w( registration.js )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
