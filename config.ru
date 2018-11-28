# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

if Rails.env.development?
  Rails.application.assets.context_class.class_eval do
    def asset_path(path, options = {})
    end
  end
end

run Rails.application
