module IronRubyInline
  class Compiler
    def initialize(language=:cs)
      @provider = CodeProvider.new(language)
    end
    
    def compile(code, parameters)
      @provider.compile_code(code, parameters.to_clr_parameters)
    end
  end
end
