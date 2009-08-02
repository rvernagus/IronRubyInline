require "test_helper"

class CompilerTest < Test::Unit::TestCase
  context "default" do
    setup do
      flexmock(IronRubyInline::Path).
        should_receive(:tmpfile => "temp_file_name").
        once
      @compiler = IronRubyInline::Compiler.new
    end
    
    should "have temp file name for output parameter" do
      result = @compiler.parameters.output
      assert_equal "temp_file_name", result
    end
    
    should "return C# provider for 'cs'" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_csharp_provider => :expected).
        once
      assert_same :expected, @compiler.provider("cs")
    end
    
    should "return C# provider for 'c#'" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_csharp_provider => :expected).
        once
      assert_same :expected, @compiler.provider("c#")
    end
    
    should "return C# provider for 'csharp'" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_csharp_provider => :expected).
        once
      assert_same :expected, @compiler.provider("csharp")
    end

    should "return C# provider for :cs" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_csharp_provider => :expected).
        once
      assert_same :expected, @compiler.provider(:cs)
    end
    
    should "return C# provider for :csharp" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_csharp_provider => :expected).
        once
      assert_same :expected, @compiler.provider(:csharp)
    end
    
    should "return VB provider for 'vb'" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_vb_provider => :expected).
        once
      assert_same :expected, @compiler.provider("vb")
    end
    
    should "return VB provider for :vb" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_vb_provider => :expected).
        once
      assert_same :expected, @compiler.provider(:vb)
    end
    
    should "return F# provider for 'fs'" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_fsharp_provider => :expected).
        once
      assert_same :expected, @compiler.provider("fs")
    end
    
    should "return F# provider for 'f#'" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_fsharp_provider => :expected).
        once
      assert_same :expected, @compiler.provider("f#")
    end
    
    should "return F# provider for 'fsharp'" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_fsharp_provider => :expected).
        once
      assert_same :expected, @compiler.provider("fsharp")
    end

    should "return F# provider for :fs" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_fsharp_provider => :expected).
        once
      assert_same :expected, @compiler.provider(:fs)
    end
    
    should "return F# provider for :fsharp" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_fsharp_provider => :expected).
        once
      assert_same :expected, @compiler.provider(:fsharp)
    end
    
    should "not be case-sensitive for C# provider" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_csharp_provider => :expected).
        once
      assert_same :expected, @compiler.provider("CS")
    end
    
    should "not be case-sensitive for VB provider" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_vb_provider => :expected).
        once
      assert_same :expected, @compiler.provider("VB")
    end
    
    should "not be case-sensitive for F# provider" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_fsharp_provider => :expected).
        once
      assert_same :expected, @compiler.provider("FS")
    end
    
    should "raise ArgumentError for unkown language" do
      assert_raise ArgumentError do
        @compiler.provider("unkown language")
      end
    end
  end
  
  context "with output specified" do
    setup do
      flexmock(IronRubyInline::Path).
        should_receive(:tmpfile).
        never
      @compiler = IronRubyInline::Compiler.new("output")
    end
    
    should "have expected output parameter" do
      result = @compiler.parameters.output
      assert_equal "output", result
    end
  end
end
