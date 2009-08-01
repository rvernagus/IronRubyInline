require 'test_helper'

class CompilerParametersTest < Test::Unit::TestCase
  context "default" do
    setup do
      @params = IronRubyInline::CompilerParameters.new
    end
    
    should "not generate an executable" do
      assert !@params.generate_executable
    end
    
    should "not treat warning as errors" do
      assert !@params.treat_warnings_as_errors
    end
  end
end