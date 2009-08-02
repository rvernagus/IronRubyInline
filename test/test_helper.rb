require "rubygems"
require "test/unit"
require "flexmock/test_unit"
require "shoulda"

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require "iron_ruby_inline"
