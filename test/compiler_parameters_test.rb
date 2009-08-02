require 'test_helper'

class CompilerParametersTest < Test::Unit::TestCase
  context "default" do
    setup do
      @params = IronRubyInline::CompilerParameters.new("output")
    end
    
    should "have expected output" do
      assert_equal "output", @params.output
    end

    should "have empty references" do
      assert_equal [], @params.references
    end
    
    context "to_clr_parameters" do
      should "set parameters to expected values" do
        mock_clr_parameters = flexmock("CLR Parameters")
        
        flexmock(IronRubyInline::ClrObjectFactory).
          should_receive(:create_compiler_parameters => mock_clr_parameters).
          once
       
        mock_clr_parameters.
          should_receive(:generate_executable=).
          once.
          with(false)
          
        mock_clr_parameters.
          should_receive(:treat_warnings_as_errors=).
          once.
          with(false)
          
        mock_clr_parameters.
          should_receive(:compiler_options=).
          once.
          with("/optimize")

        mock_clr_parameters.
          should_receive(:output_assembly=).
          once.
          with("output")
        
        mock_clr_parameters.
          should_receive("referenced_assemblies.add").
          never
          
        result = @params.to_clr_parameters
        assert_same result, mock_clr_parameters
      end
    end
  end

  context "with single reference" do
    setup do
      @params = IronRubyInline::CompilerParameters.new("output", ["reference1"])
    end
    
    should "have expected output" do
      assert_equal "output", @params.output
    end
    
    should "have single references" do
      assert_equal ["reference1"], @params.references
    end

    context "to_clr_parameters" do
      should "set parameters to expected values" do
        mock_clr_parameters = flexmock("CLR Parameters")
        mock_clr_parameters.should_ignore_missing
        
        flexmock(IronRubyInline::ClrObjectFactory).
          should_receive(:create_compiler_parameters => mock_clr_parameters).
          once
        
        mock_clr_parameters.
          should_receive("referenced_assemblies.add").
          once.
          with("reference1")
          
        @params.to_clr_parameters
      end
    end
  end

  context "with multiple references" do
    setup do
      @params = IronRubyInline::CompilerParameters.new("output", ["reference1", "reference2"])
    end
    
    should "have expected output" do
      assert_equal "output", @params.output
    end
    
    should "have expected references" do
      assert_equal ["reference1", "reference2"], @params.references
    end
    
    context "to_clr_parameters" do
      should "set parameters to expected values" do
        mock_clr_parameters = flexmock("CLR Parameters")
        mock_clr_parameters.should_ignore_missing
        
        flexmock(IronRubyInline::ClrObjectFactory).
          should_receive(:create_compiler_parameters => mock_clr_parameters).
          once
        
        mock_clr_parameters.
          should_receive("referenced_assemblies.add").
          once.
          with("reference1")
          
        mock_clr_parameters.
          should_receive("referenced_assemblies.add").
          once.
          with("reference2")
          
        @params.to_clr_parameters
      end
    end
  end
end