# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end
CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/uploads"
end
