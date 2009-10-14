$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'sequel'
require 'sequel/extensions/migration'
require 'sequel/extensions/schema_dumper'
require 'sqlite3'
if(defined? Shoes) #Real environment
  DB = Sequel.connect("sqlite://#{DATABASE_PATH}")
  Sequel::Migrator.apply(DB, 'lib/migrations/')
else               #Test environment
  DB = Sequel.connect("sqlite::memory:")
end
Infinity = 1/0.0
require 'opensprints-core/tournament'
require 'opensprints-core/tournament_participation'
require 'opensprints-core/category'
require 'opensprints-core/racer'
require 'opensprints-core/race'
require 'opensprints-core/race_participation'
require 'opensprints-core/categorization'
