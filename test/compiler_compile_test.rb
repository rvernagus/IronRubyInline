require "test_helper"

class CompilerCompileTest < Test::Unit::TestCase
  include IronRubyInline

  context "when no output is specified" do
    setup do
      def Compiler.compile_from_parameters(code, parameters)
        $parameters = parameters
      end
      flexmock(IronRubyInline::Path).
        should_receive(:tmpfile => "tempfilename").
        once
    end
    
    should "use temp file name for output parameter" do
      IronRubyInline::Compiler.compile("code")
      assert_equal "tempfilename", $parameters.output
    end
  end
  
  context "when output is specified" do
    should "use specified file name for output parameter" do
      IronRubyInline::Compiler.compile("code", :output => "output")
      assert_equal "output", $parameters.output
    end
  end
end
