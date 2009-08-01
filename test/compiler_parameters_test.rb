require 'test_helper'

class CompilerParametersTest < Test::Unit::TestCase
  context "default" do
    setup do
      @params = IronRubyInline::CompilerParameters.new("output")
    end
    
    should "not generate an executable" do
      assert !@params.generate_executable
    end
    
    should "not treat warning as errors" do
      assert !@params.treat_warnings_as_errors
    end
    
    should "have expected compiler options" do
      assert_equal "/optimize", @params.compiler_options
    end
    
    should "set output assembly" do
      assert_equal "output", @params.output_assembly
    end
    
    should "not specify referenced assemblies" do
      assert_has 0, @params.referenced_assemblies
    end
  end
  
  context "with reference" do
    setup do
      @params = IronRubyInline::CompilerParameters.new("output", ["reference1"])
    end
    
    should "add reference" do
      assert_has 1, @params.referenced_assemblies
      assert_equal "reference1", @params.referenced_assemblies[0]
    end
  end
end