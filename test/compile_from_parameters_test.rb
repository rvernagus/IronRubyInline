require "test_helper"

class CompilerCompileTest < Test::Unit::TestCase
  context "all" do
    setup do
      @mock_provider = flexmock("Provider")
      @mock_provider.
        should_receive(:dispose).
        once
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_csharp_provider => @mock_provider).
        once
    end
    
    should "dispose of provider" do
      @mock_provider.
        should_receive(:compile_assembly_from_source => :result).
        once
      result = IronRubyInline::Compiler.
        compile_from_parameters("code", flexmock(:language => :cs))
      assert_equal :result, result
    end
    
    should "dispose of provider on error" do
      @mock_provider.
        should_receive(:compile_assembly_from_source).
        once.
        and_raise(RuntimeError)
      IronRubyInline::Compiler.
        compile_from_parameters("code", flexmock(:language => :cs)) rescue RuntimeError
    end
  end
end
