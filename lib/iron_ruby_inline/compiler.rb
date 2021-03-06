module IronRubyInline
  class Compiler
    def initialize(language=:cs)
      @provider = CodeProvider.new(language)
    end
    
    def compile(code, parameters)
      use @provider do |p|
        results = p.compile_code(code, parameters.to_clr_parameters)
        errors = results.errors
        if not errors.empty?
          message = errors.join("\n")
          raise CompileError.new(message)
        end
        results
      end
    end
    
    def load(results)
      Kernel.require results.path_to_assembly
      results.path_to_assembly
    end
    
    def compile_and_load(code, parameters=CompilerParameters.new)
      results = compile(code, parameters)
      load results
    end
  end
end
