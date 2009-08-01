require 'test_helper'

class CompilerParametersTest < Test::Unit::TestCase
  context "default" do
    setup do
      @params = CompilerParameters.new
    end
    
    should "not generate an executable" do
      assert !@params.generate_executable
    end
  end
end