Rubycommitters::Application.configure do
  config.cache_classes       = true
  config.i18n.fallbacks      = true
  config.serve_static_assets = false
  config.active_support.deprecation        = :notify
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.action_dispatch.x_sendfile_header = "X-Sendfile"
end
