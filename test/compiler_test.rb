require "test_helper"

class CompilerTest < Test::Unit::TestCase
  context "all" do
    setup do
      @mock_parameters = flexmock("Parameters")
      @mock_provider = flexmock("Provider")
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_csharp_provider => @mock_provider).
        once
      @compiler = IronRubyInline::Compiler.new
    end
    
    context "compile" do
      setup do
        @mock_parameters.
          should_receive(:to_clr_parameters).
          once.
          and_return(:clr_parameters)
        @mock_provider.
          should_receive(:compile_assembly_from_source).
          once.
          with(:clr_parameters, "code")   .
          and_return(:result)
      end
      
      should "call compile_code on provider with expected args" do
        @compiler.compile("code", @mock_parameters)
      end
      
      should "return compile results" do
        result = @compiler.compile("code", @mock_parameters)
        assert_equal :result, result
      end
    end
  end
end
