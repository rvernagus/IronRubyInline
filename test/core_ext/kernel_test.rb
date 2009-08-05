require File.dirname(__FILE__) + "/../test_helper"

class KernelTest < Test::Unit::TestCase
  context "use" do
    setup do
      @mock_disposable = flexmock("Disposable")
      @mock_disposable.
        should_receive(:dispose).
        once
    end
    
    should "yield the passed object" do
      was_called = false
      use(@mock_disposable) do |obj|
        assert_same obj, @mock_disposable
        was_called = true
      end
      assert was_called
    end
    
    should "evaluate to result of yield" do
      expected = Object.new
      result = use(@mock_disposable) { expected }
      assert_same result, expected
    end
    
    should "ensure dispose" do
      use(@mock_disposable) { raise "BOOM" } rescue RuntimeError
    end
  end
end
