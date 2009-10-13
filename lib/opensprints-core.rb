$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'sequel'
require 'sequel/extensions/migration'
require 'sequel/extensions/schema_dumper'
require 'sqlite3'
if(defined? Shoes) #Real environment
  DB = Sequel.connect("sqlite://#{DATABASE_PATH}")
else               #Test environment
  DB = Sequel.connect("sqlite::memory:")
end
Sequel::Migrator.apply(DB, 'lib/migrations/')
Infinity = 1/0.0
require 'lib/tournament'
require 'lib/tournament_participation'
require 'lib/category'
require 'lib/racer'
require 'lib/race'
require 'lib/race_participation'
require 'lib/categorization'
