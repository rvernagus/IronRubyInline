require "test_helper"

class CodeProviderTest < Test::Unit::TestCase
  def get_provider(language)
    IronRubyInline::CodeProvider.new(language)
  end
  
  context "all" do
    setup do
      @mock_provider = flexmock("Provider")
      flexstub(IronRubyInline::ClrObjectFactory).
        should_receive(:create_csharp_provider => @mock_provider)
      @provider = IronRubyInline::CodeProvider.new
    end

    should "dispose of inner_provider on dispose" do
      @mock_provider.
        should_receive(:dispose).
        once
      @provider.dispose
    end
    
    should "call expected method on inner provider in compile_code" do
      @mock_provider.
        should_receive(:compile_assembly_from_source).
        with("code", :params).
        once
      @provider.compile_code(:params, "code")
    end
  end
      
  context "default" do
    setup do
      flexstub(IronRubyInline::ClrObjectFactory).
        should_receive(:create_csharp_provider => :csharp_provider)
      flexstub(IronRubyInline::ClrObjectFactory).
        should_receive(:create_fsharp_provider => :fsharp_provider)
      flexstub(IronRubyInline::ClrObjectFactory).
        should_receive(:create_vb_provider => :vb_provider)
      @provider = IronRubyInline::CodeProvider.new
    end
    
    should "be C#" do
      assert_same :csharp_provider, @provider.inner_provider
    end
  end
  
  context "when language is specified" do
    setup do
      flexstub(IronRubyInline::ClrObjectFactory).
        should_receive(:create_csharp_provider => :csharp_provider)
      flexstub(IronRubyInline::ClrObjectFactory).
        should_receive(:create_fsharp_provider => :fsharp_provider)
      flexstub(IronRubyInline::ClrObjectFactory).
        should_receive(:create_vb_provider => :vb_provider)
    end
    
    should "be C# for 'cs'" do
      provider = get_provider("cs")
      assert_equal :csharp_provider, provider.inner_provider
    end
    
    should "be C# for 'c#'" do
      provider = get_provider("c#")
      assert_equal :csharp_provider, provider.inner_provider
    end

    should "be C# for 'csharp'" do
      provider = get_provider("csharp")
      assert_equal :csharp_provider, provider.inner_provider
    end

    should "be C# for :cs" do
      provider = get_provider(:cs)
      assert_equal :csharp_provider, provider.inner_provider
    end

    should "be C# for :csharp" do
      provider = get_provider(:csharp)
      assert_equal :csharp_provider, provider.inner_provider
    end
    
    should "be VB for 'vb'" do
      provider = get_provider("vb")
      assert_equal :vb_provider, provider.inner_provider
    end

    should "be VB for :vb" do
      provider = get_provider(:vb)
      assert_equal :vb_provider, provider.inner_provider
    end

    should "be F# for 'fs'" do
      provider = get_provider("fs")
      assert_equal :fsharp_provider, provider.inner_provider
    end

    should "be F# for 'f#'" do
      provider = get_provider("f#")
      assert_equal :fsharp_provider, provider.inner_provider
    end

    should "be F# for 'fsharp'" do
      provider = get_provider("fsharp")
      assert_equal :fsharp_provider, provider.inner_provider
    end

    should "be F# for :fs" do
      provider = get_provider(:fs)
      assert_equal :fsharp_provider, provider.inner_provider
    end

    should "be F# for :fsharp" do
      provider = get_provider(:fsharp)
      assert_equal :fsharp_provider, provider.inner_provider
    end

    should "not be case-sensitive when C#" do
      provider = get_provider("CS")
      assert_equal :csharp_provider, provider.inner_provider
    end

    should "not be case-sensitive when VB" do
      provider = get_provider("VB")
      assert_equal :vb_provider, provider.inner_provider
    end

    should "not be case-sensitive when F#" do
      provider = get_provider("FS")
      assert_equal :fsharp_provider, provider.inner_provider
    end

    should "raise ArgumentError for unkown language" do
      assert_raise ArgumentError do
        get_provider("unkown language")
      end
    end
  end
end
