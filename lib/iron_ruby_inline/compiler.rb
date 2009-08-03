module IronRubyInline
  module Compiler
    def self.compile(code, options={})
      output = options[:output] || Path.tmpfile
      parameters = CompilerParameters.new(output)
      
      compile_from_parameters(code, parameters)
    end
    
    def self.compile_from_parameters(code, parameters)
      use(provider(parameters.language)) do |prov|
        prov.compile_assembly_from_source(code)
      end
    end
  end
end
