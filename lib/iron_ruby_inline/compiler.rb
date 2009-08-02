module IronRubyInline
  class Compiler
    attr_reader :parameters
    
    def initialize(output=nil)
      output = Path.tmpfile if output.nil?
      @parameters = CompilerParameters.new(output)
    end
  end
end
