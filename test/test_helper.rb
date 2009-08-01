require "rubygems"
require "test/unit"
require "shoulda"

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require "dotnet_standins"
require "iron_ruby_inline"

class Test::Unit::TestCase
  def assert_has(n, x)
    assert_equal n, x.length
  end
end
