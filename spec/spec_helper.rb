require 'rubygems'
require 'active_support'
require 'active_support/test_case'
require 'active_record'

require File.join(File.dirname(__FILE__), '..', 'lib', 'negative_named_scope')

require File.join(File.dirname(__FILE__), 'models')

TEST_DATABASE_FILE = File.join(File.dirname(__FILE__), 'test.sqlite3')


def setup_database
  File.unlink(TEST_DATABASE_FILE) if File.exist?(TEST_DATABASE_FILE)
  ActiveRecord::Base.establish_connection(
    "adapter" => "sqlite3", "timeout" => 5000, "database" => TEST_DATABASE_FILE
  )
  create_tables
  load_fixtures
end

def create_tables
  c = ActiveRecord::Base.connection
  
  c.create_table :posts, :force => true do |t|
    t.string :name
    t.boolean :published, :null => false
    t.integer :rating, :null => false
  end

end

def load_fixtures
  Post.create(:name => 'True', :published => true, :rating => 100)
  Post.create(:name => 'False', :published => false, :rating => 3)
end

setup_database