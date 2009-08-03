require "test_helper"

class CompilerProviderTest < Test::Unit::TestCase
  context "provider" do
    should "return C# provider for 'cs'" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_csharp_provider => :expected).
        once
      assert_same :expected, IronRubyInline::Compiler.provider("cs")
    end
    
    should "return C# provider for 'c#'" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_csharp_provider => :expected).
        once
      assert_same :expected, IronRubyInline::Compiler.provider("c#")
    end
    
    should "return C# provider for 'csharp'" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_csharp_provider => :expected).
        once
      assert_same :expected, IronRubyInline::Compiler.provider("csharp")
    end

    should "return C# provider for :cs" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_csharp_provider => :expected).
        once
      assert_same :expected, IronRubyInline::Compiler.provider(:cs)
    end
    
    should "return C# provider for :csharp" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_csharp_provider => :expected).
        once
      assert_same :expected, IronRubyInline::Compiler.provider(:csharp)
    end
    
    should "return VB provider for 'vb'" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_vb_provider => :expected).
        once
      assert_same :expected, IronRubyInline::Compiler.provider("vb")
    end
    
    should "return VB provider for :vb" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_vb_provider => :expected).
        once
      assert_same :expected, IronRubyInline::Compiler.provider(:vb)
    end
    
    should "return F# provider for 'fs'" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_fsharp_provider => :expected).
        once
      assert_same :expected, IronRubyInline::Compiler.provider("fs")
    end
    
    should "return F# provider for 'f#'" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_fsharp_provider => :expected).
        once
      assert_same :expected, IronRubyInline::Compiler.provider("f#")
    end
    
    should "return F# provider for 'fsharp'" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_fsharp_provider => :expected).
        once
      assert_same :expected, IronRubyInline::Compiler.provider("fsharp")
    end

    should "return F# provider for :fs" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_fsharp_provider => :expected).
        once
      assert_same :expected, IronRubyInline::Compiler.provider(:fs)
    end
    
    should "return F# provider for :fsharp" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_fsharp_provider => :expected).
        once
      assert_same :expected, IronRubyInline::Compiler.provider(:fsharp)
    end
    
    should "not be case-sensitive for C# provider" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_csharp_provider => :expected).
        once
      assert_same :expected, IronRubyInline::Compiler.provider("CS")
    end
    
    should "not be case-sensitive for VB provider" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_vb_provider => :expected).
        once
      assert_same :expected, IronRubyInline::Compiler.provider("VB")
    end
    
    should "not be case-sensitive for F# provider" do
      flexmock(IronRubyInline::ClrObjectFactory).
        should_receive(:create_fsharp_provider => :expected).
        once
      assert_same :expected, IronRubyInline::Compiler.provider("FS")
    end
    
    should "raise ArgumentError for unkown language" do
      assert_raise ArgumentError do
        IronRubyInline::Compiler.provider("unkown language")
      end
    end
  end
end
