module IronRubyInline
  class Compiler
    def initialize(language=:cs)
      @provider = CodeProvider.new(language)
    end
    
    def compile(code, options={})
      output = options[:output] || Path.tmpfile
      puts " output >>>>>>>> #{output.inspect}"
      references = options[:references] || []
      parameters = CompilerParameters.new(output, references)
      
      @provider.compile_assembly_from_source(parameters.to_clr_parameters, code)
    end
  end
end
