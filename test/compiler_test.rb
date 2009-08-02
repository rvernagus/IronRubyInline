require "test_helper"

class CompilerTest < Test::Unit::TestCase
  context "default" do
    setup do
      flexmock(IronRubyInline::Path).
        should_receive(:tmpfile => "temp_file_name").
        once
      @compiler = IronRubyInline::Compiler.new
    end
    
    should "have temp file name for parameters output" do
      result = @compiler.parameters.output
      assert_equal "temp_file_name", result
    end
  end
end
