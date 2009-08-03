module IronRubyInline
  class Compiler
    def initialize(language=:cs)
      @provider = CodeProvider.new(language)
    end
    
    def compile(code, parameters)
      @provider.compile_code(code, parameters.to_clr_parameters)
    end
    
    def load(results)
      Kernel.require results.path_to_assembly
      results.path_to_assembly
    end
  end
end
