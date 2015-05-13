module SnapStories
  class App < Padrino::Application
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions
    #configure our JSON builder, RABL
    Rabl.configure do |config|
        config.include_json_root = false
        config.include_child_root = false
    end

    get '/hello' do 
        puts 'hello'
    end

    ##
    # Caching support.
    #
    # register Padrino::Cache
    # enable :caching
    #
    # You can customize caching store engines:
    #
    # set :cache, Padrino::Cache.new(:LRUHash) # Keeps cached values in memory
    # set :cache, Padrino::Cache.new(:Memcached) # Uses default server at localhost
    # set :cache, Padrino::Cache.new(:Memcached, '127.0.0.1:11211', :exception_retry_limit => 1)
    # set :cache, Padrino::Cache.new(:Memcached, :backend => memcached_or_dalli_instance)
    # set :cache, Padrino::Cache.new(:Redis) # Uses default server at localhost
    # set :cache, Padrino::Cache.new(:Redis, :host => '127.0.0.1', :port => 6379, :db => 0)
    # set :cache, Padrino::Cache.new(:Redis, :backend => redis_instance)
    # set :cache, Padrino::Cache.new(:Mongo) # Uses default server at localhost
    # set :cache, Padrino::Cache.new(:Mongo, :backend => mongo_client_instance)
    # set :cache, Padrino::Cache.new(:File, :dir => Padrino.root('tmp', app_name.to_s, 'cache')) # default choice
    #

    ##
    # Application configuration options.
    #
    # set :raise_errors, true       # Raise exceptions (will stop application) (default for test)
    # set :dump_errors, true        # Exception backtraces are written to STDERR (default for production/development)
    # set :show_exceptions, true    # Shows a stack trace in browser (default for development)
    # set :logging, true            # Logging in STDOUT for development and file for production (default only for development)
    # set :public_folder, 'foo/bar' # Location for static assets (default root/public)
    # set :reload, false            # Reload application files (default in development)
    # set :default_builder, 'foo'   # Set a custom form builder (default 'StandardFormBuilder')
    # set :locale_path, 'bar'       # Set path for I18n translations (default your_apps_root_path/locale)
    # disable :sessions             # Disabled sessions by default (enable if needed)
    # disable :flash                # Disables sinatra-flash (enabled by default if Sinatra::Flash is defined)
    # layout  :my_layout            # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
    #

    ##
    # You can configure for a specified environment like:
    #
    #   configure :development do
    #     set :foo, :bar
    #     disable :asset_stamp # no asset timestamping for dev
    #   end
    #

    #Before every request
    #1. Capture any JSON payload and put it in @data
    #2. Authenticate non-idempotent methods via the API key
    before do
        catch_payload #creates data variable to hold all PUT/PATCH/POST data
        #exclude PUT /login and PUT /users from requiring an api_key
        if request.path_info.split('/') & ["login", "users"] == [] && request.request_method == "PUT"
            if ["PUT", "DELETE", "PATCH", "POST"].include? request.request_method
                # authenticate_api_key
            end
        end
    end

    #Throw custom 404s for records not found in our AR/Mongo databases
    error ActiveRecord::RecordNotFound do
      @error = APIError.new(404, 'That object was not found!')
      halt 404, render('errors/single')
    end
    error Mongoid::Errors::DocumentNotFound do
      @error = APIError.new(404, 'That object was not found!')
      halt 404, render('errors/single')
    end

    #Enable Bullet, a gem to capture N+1 queries and log them
    configure :development do
      Bullet.enable = true
      Bullet.bullet_logger = true
      use Bullet::Rack
    end
  end
end
