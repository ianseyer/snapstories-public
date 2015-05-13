# ActiveRecord Database Configuration
ActiveRecord::Base.configurations[:development] = {
  :adapter   => 'postgresql',
  :database  => 'd9pa7m1i0p2qlf',
  :username  => 'msbiwicrjvikch',
  :password  => 'kLF9F8glNFAsBEgfmOfY-nY2I5',
  :host      => 'ec2-184-73-165-195.compute-1.amazonaws.com',
  :port      => 5432
}

ActiveRecord::Base.configurations[:production] = {
  :adapter   => 'postgresql',
  :database  => 'd9pa7m1i0p2qlf',
  :username  => 'msbiwicrjvikch',
  :password  => 'kLF9F8glNFAsBEgfmOfY-nY2I5',
  :host      => 'ec2-184-73-165-195.compute-1.amazonaws.com',
  :port      => 5432
}

ActiveRecord::Base.configurations[:test] = {
  :adapter   => 'postgresql',
  :database  => 'd9pa7m1i0p2qlf',
  :username  => 'msbiwicrjvikch',
  :password  => 'kLF9F8glNFAsBEgfmOfY-nY2I5',
  :host      => 'ec2-184-73-165-195.compute-1.amazonaws.com',
  :port      => 5432
}

ActiveRecord::Base.logger = logger

if ActiveRecord::VERSION::MAJOR.to_i < 4
  # Raise exception on mass assignment protection for Active Record models.
  ActiveRecord::Base.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL).
  ActiveRecord::Base.auto_explain_threshold_in_seconds = 0.5
end

# Doesn't include Active Record class name as root for JSON serialized output.
ActiveRecord::Base.include_root_in_json = false

# Store the full class name (including module namespace) in STI type column.
ActiveRecord::Base.store_full_sti_class = true

# Use ISO 8601 format for JSON serialized times and dates.
ActiveSupport.use_standard_json_time_format = true

# Don't escape HTML entities in JSON, leave that for the #json_escape helper
# if you're including raw JSON in an HTML page.
ActiveSupport.escape_html_entities_in_json = false

# Now we can establish connection with our db.
ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations[Padrino.env])

# Timestamps are in the utc by default.
ActiveRecord::Base.default_timezone = :utc

#MongoDB Database configuration
# Connection.new takes host and port.

host = 'candidate.17.mongolayer.com'
port = 10775
username = 'heroku'
password = 'whPefF2mpkUcIYSr1BMNJZdjTLaBMorVvxRWb8Q6EOqqjlEK-LSTww50ks4XFXFtcvS_RjU3nfn5c1rK2ykyCQ'

database_name = case Padrino.env
  when :development then 'app36531563'
  when :production  then 'app36531563'
  when :test        then 'app36531563'
end

# Use MONGO_URI if it's set as an environmental variable.
Mongoid::Config.sessions =
  if ENV['MONGO_URI']
    {default: {uri: ENV['MONGO_URI'] }}
  else
    {default: {hosts: ["#{host}:#{port}"], database: database_name, username:username, password:password}}
  end

# If you want to use a YML file for config, use this instead:
#
#   Mongoid.load!(File.join(Padrino.root, 'config', 'database.yml'), Padrino.env)
#
# And add a config/database.yml file like this:
#   development:
#     sessions:
#       default:
#         database: snapstories_development
#         hosts:
#           - localhost:27017
#   production:
#     sessions:
#       default:
#         database: snapstories_production
#         hosts:
#           - localhost:27017
#   test:
#     sessions:
#       default:
#         database: snapstories_test
#         hosts:
#           - localhost:27017
#
#
# More installation and setup notes are on http://mongoid.org/en/mongoid/docs/installation.html#configuration
