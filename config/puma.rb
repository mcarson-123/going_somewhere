workers Integer(ENV['WEB_CONCURRENCY'] || 3)
threads Integer(ENV['WEB_MIN_THREADS'] || 8), Integer(ENV['WEB_MAX_THREADS'] || 8)

preload_app!

port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    config = ActiveRecord::Base.configurations[Rails.env]
    config["pool"] = ENV["WEB_MAX_THREADS"] || 8

    ActiveRecord::Base.establish_connection(config)
  end
end
