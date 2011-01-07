Rubycommitters::Application.configure do
  config.whiny_nils    = true
  config.cache_classes = false
  config.action_view.debug_rjs                  = true
  config.active_support.deprecation             = :log
  config.consider_all_requests_local            = true
  config.action_controller.perform_caching      = false
  config.action_dispatch.best_standards_support = :builtin
end
