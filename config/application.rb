require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Taskapp
  class Application < Rails::Application
    config.load_defaults 5.2
    # change erb to slim
    config.generators.template_engine = :slim
    # set time_zone
    #config.time_zone = 'Tokyo'
    #config.active_record.default_timezone = :local
    # delete html_tag from error
    #config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      #%Q(#{html_tag}).html_safe
    #end
    # not producing files at scaffold command
    config.generators do |g|
      g.assets false
      g.helper false
      g.jbuilder false
    end
    # 404 & 500 are defined on /errors/*.html.slim
    #config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
  end
end
