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
        @mock_results = flexmock("CompilerResults")
        @mock_parameters.
          should_receive(:to_clr_parameters).
          once.
          and_return(:clr_parameters)
        @mock_provider.
          should_receive(:compile_assembly_from_source).
          once.
          with(:clr_parameters, "code")   .
          and_return(@mock_results)
        @mock_provider.
          should_receive(:dispose)
      end
      
      should "call compile_code on provider with expected args" do
        @mock_results.
          should_receive("errors" => nil)
        @compiler.compile("code", @mock_parameters)
      end
      
      should "return compile results" do
        @mock_results.
          should_receive("errors" => nil)
        result = @compiler.compile("code", @mock_parameters)
        assert_same @mock_results, result
      end
      
      should "raise CompileError when errors" do
        @mock_results.
          should_receive("errors").
          once.
          and_return(["error"])
        assert_raise IronRubyInline::CompileError do
          @compiler.compile("code", @mock_parameters)
        end
      end
      
      should "return expected error message" do
        @mock_results.
          should_receive("errors").
          once.
          and_return(["error1", "error2"])
        begin
          @compiler.compile("code", @mock_parameters)
          flunk "CompileError was expected"
        rescue IronRubyInline::CompileError => err
          assert_equal "error1\nerror2", err.message
        end
      end
    end
    
    context "load" do
      setup do
        flexmock(Kernel).
          should_receive(:require).
          once.
          with("assembly_path")        
        @mock_results = flexmock(:path_to_assembly => "assembly_path")
      end
      
      should "load from path_to_assembly" do
        @compiler.load(@mock_results)
      end
      
      should "return path to loaded assembly" do
        result = @compiler.load(@mock_results)
        assert_equal "assembly_path", result
      end
    end
    
    context "compile_and_load" do
      should "chain calls to compile and load" do
        flexmock(@compiler).
          should_receive(:compile).
          once.
          with("code", :parameters).
          and_return(:results)
        flexmock(@compiler).
          should_receive(:load).
          once.
          with(:results)
        @compiler.compile_and_load("code", :parameters)
      end
    end
  end
end
