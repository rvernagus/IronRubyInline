require "test_helper"

class CompilerCompileTest < Test::Unit::TestCase
  include IronRubyInline
  
  context "when no output is specified" do
    setup do
      flexmock(IronRubyInline::Path).
        should_receive(:tmpfile => "tempfilename").
        once
    end
    
    should "use temp file name for output parameter" do
      def Compiler.compile_from_parameters(code, parameters)
        $parameters = parameters
      end
      IronRubyInline::Compiler.compile("code")
      assert_equal "tempfilename", $parameters.output
    end
  end
end
