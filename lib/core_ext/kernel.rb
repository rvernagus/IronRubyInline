module Kernel
  def use(obj)
    begin
      result = yield obj if block_given?
    ensure
      obj.dispose
    end
    result
  end
end
