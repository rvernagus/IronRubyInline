require "test_helper"

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
    
    should "default to C#" do
      assert_equal :cs, @params.language
    end
    
    context "to_clr_parameters" do
      setup do
        @mock_clr_parameters = flexmock("CLR Parameters")
        @mock_clr_parameters.should_ignore_missing
        
        flexmock(IronRubyInline::ClrObjectFactory).
          should_receive(:create_compiler_parameters => @mock_clr_parameters).
          once
      end

      should "return CLR parameters" do
        result = @params.to_clr_parameters
        assert_same result, @mock_clr_parameters
      end
      
      should "not generate executable" do
        @mock_clr_parameters.
          should_receive(:generate_executable=).
          once.
          with(false)
        @params.to_clr_parameters
      end
      
      should "not treat warnings as errors" do
        @mock_clr_parameters.
          should_receive(:treat_warnings_as_errors=).
          once.
          with(false)
        @params.to_clr_parameters
      end
      
      should "set expected compiler options" do
        @mock_clr_parameters.
          should_receive(:compiler_options=).
          once.
          with("/optimize")
        @params.to_clr_parameters
      end
      
      should "set expected output assembly" do
        @mock_clr_parameters.
          should_receive(:output_assembly=).
          once.
          with("output")
        @params.to_clr_parameters
      end
      
      should "not add referenced assemblies" do
        @mock_clr_parameters.
          should_receive("referenced_assemblies.add").
          never
        @params.to_clr_parameters
      end
    end
  end

  context "with single reference" do
    setup do
      @params = IronRubyInline::CompilerParameters.new("output", :cs, ["reference1"])
    end
    
    should "have expected output" do
      assert_equal "output", @params.output
    end
    
    should "have single references" do
      assert_equal ["reference1"], @params.references
    end

    context "to_clr_parameters" do
      setup do
        @mock_clr_parameters = flexmock("CLR Parameters")
        @mock_clr_parameters.should_ignore_missing
        
        flexmock(IronRubyInline::ClrObjectFactory).
          should_receive(:create_compiler_parameters => @mock_clr_parameters).
          once
      end
      
      should "add reference assembly" do
        @mock_clr_parameters.
          should_receive("referenced_assemblies.add").
          once.
          with("reference1")
        @params.to_clr_parameters
      end
    end
  end

  context "with multiple references" do
    setup do
      @params = IronRubyInline::CompilerParameters.new("output", :cs, ["reference1", "reference2"])
    end
    
    should "have expected output" do
      assert_equal "output", @params.output
    end
    
    should "have expected references" do
      assert_equal ["reference1", "reference2"], @params.references
    end
    
    context "to_clr_parameters" do
      setup do
        @mock_clr_parameters = flexmock("CLR Parameters")
        @mock_clr_parameters.should_ignore_missing
        
        flexmock(IronRubyInline::ClrObjectFactory).
          should_receive(:create_compiler_parameters => @mock_clr_parameters).
          once
      end
        
      should "add referenced assemblies" do
        @mock_clr_parameters.
          should_receive("referenced_assemblies.add").
          once.
          with("reference1")
        @mock_clr_parameters.
          should_receive("referenced_assemblies.add").
          once.
          with("reference2")
        @params.to_clr_parameters
      end
    end
  end
end